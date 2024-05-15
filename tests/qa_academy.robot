
*** Settings ***
Documentation    testes de login e cadastro de usuário
Resource          ../resources/main.robot


*** Test Cases ***
login_valido
    [Tags]    CT01
    abrir_navegador   
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL}
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD}
    tirar_print    logs/prints_login   preecheu_login
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_visivel    ${CAMPO_CADASTROS} 
    tirar_print    logs/prints_login    fez_login
    fechar_navegador
    
login_invalido
    [Tags]    CT01
    abrir_navegador 
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL_INVALIDO}
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD_INVALIDO}
    clicar_elemento    ${BOTAO_ENTRAR} 
    elemento_contem_texto    ${MENSAGEM_CAMPO_INVALIDO}        E   
    tirar_print    logs/prints_login    preecheu_email_invalido-pagina              
    fechar_navegador

campo_email_e_senha_vazio
    [Tags]    CT01
    abrir_navegador
    limpar_campo    ${CAMPO_LOGIN_EMAIL}
    limpar_campo    ${CAMPO_LOGIN_SENHA}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    ${SENHA_VAZIA_MENSAGEM}    A senha é obrigatória
    elemento_contem_texto    ${EMAIL_VAZIO_MENSAGEM}    O email é obrigatório
    fechar_navegador

campo_senha_vazio
    [Tags]    CT01
    abrir_navegador
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL}
    limpar_campo    ${CAMPO_LOGIN_SENHA}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    ${SENHA_VAZIA_MENSAGEM}    A senha é obrigatória
    fechar_navegador

campo_email_vazio
    [Tags]    CT01
    abrir_navegador
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    ${EMAIL_VAZIO_MENSAGEM}    O email é obrigatório
    fechar_navegador        

fazer_logout
    [Tags]    CT02 
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    tirar_print    logs/prints_home    fez_login_para_logout
    clicar_elemento    ${BOTAO_LOGOUT}
    elemento_visivel    ${BOTAO_ENTRAR}
    tirar_print    logs/prints_home     fez_logout
    fechar_navegador

cadastrar_usuario_com_sucesso
    [Tags]    CT03     
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS}   
    clicar_elemento    ${BOTAO_USUARIOS}
    elemento_visivel    ${BOTAO_EDITAR_USUARIOS}    #SÓ PARA GARANTIR QUE ESTÁ NA PÁGINA DE CADASTRO DE USUÁRIO
    clicar_elemento    ${NOVO_CADASTRO_DE_USUARIO}
    ${variavel_temporaria_nome}=    gerar_nome_aleatorio
    preencher_texto    ${CAMPO_NOME_USUARIO}   ${variavel_temporaria_nome}
    ${variavel_temporaria_email}=    gerar_email_aleatorio
    preencher_texto    ${CAMPO_EMAIL_USUARIO}    ${variavel_temporaria_email}
    preencher_texto    ${CAMPO_ACESSO_USUARIO}    ${TIPO_USUARIO}
    ${variavel_temporaria_cpf}=    gerar_cpf_aleatorio
    preencher_texto    ${CAMPO_CPF_USUARIO}    ${variavel_temporaria_cpf}
    ${variavel_temporaria_password}=    gerar_password_aleatorio
    preencher_texto    ${CAMPO_LOGIN_SENHA}    ${variavel_temporaria_password}
    preencher_texto    ${CAMPO_CONFIRMAR_SENHA_USUARIO}    ${variavel_temporaria_password}
    clicar_elemento    ${BOTAO_SALVAR}
    tirar_print    logs/prints_usuario     preencheu_cadastro_usuario
    elemento_nao_visivel    ${ALERTA_DE_CAMPOS_INCORRETOS_USUARIOS}
    clicar_elemento    ${BOTAO_LOGOUT}
    login_valido_keyword    ${variavel_temporaria_email}    ${variavel_temporaria_password}
    tirar_print    logs/prints_usuario    preencheu_login_novo_usuario
    elemento_visivel    ${CAMPO_CADASTROS}
    fechar_navegador


campos_nome_vazio_de _cadastrar_usuario   #os campos de senha não tem mesagem de erro por isso não os acresentei no teste
    [Tags]    CT03
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS} 
    clicar_elemento    ${BOTAO_USUARIOS}
    elemento_visivel    ${BOTAO_EDITAR_USUARIOS}    
    clicar_elemento    ${NOVO_CADASTRO_DE_USUARIO}
    clicar_elemento    ${BOTAO_SALVAR}
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo nome completo é obrigatório')]    O campo nome completo é obrigatório
    tirar_print    logs/prints_usuario    campos_vazios_cadastro_usuario_nome
    fechar_navegador

campos_email_vazio_de _cadastrar_usuario 
    [Tags]    CT03
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS} 
    clicar_elemento    ${BOTAO_USUARIOS}
    elemento_visivel    ${BOTAO_EDITAR_USUARIOS}    
    clicar_elemento    ${NOVO_CADASTRO_DE_USUARIO}
    clicar_elemento    ${BOTAO_SALVAR}
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo email é obrigatório')]    O campo email é obrigatório
    tirar_print    logs/prints_usuario    campos_vazios_cadastro_usuario_email
    fechar_navegador

campo_perfil_vazio_de_cadastrar_usuario
    [Tags]    CT03
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS} 
    clicar_elemento    ${BOTAO_USUARIOS}
    elemento_visivel    ${BOTAO_EDITAR_USUARIOS}    
    clicar_elemento    ${NOVO_CADASTRO_DE_USUARIO}
    clicar_elemento    ${BOTAO_SALVAR}
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo perfil de acesso é obrigatório')]    O campo perfil de acesso é obrigatório
    tirar_print    logs/prints_usuario    campos_vazios_cadastro_usuario_perfil
    fechar_navegador

campo_cpf_vazio_de_cadastrar_usuario
    [Tags]    CT03
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS} 
    clicar_elemento    ${BOTAO_USUARIOS}
    elemento_visivel    ${BOTAO_EDITAR_USUARIOS}    
    clicar_elemento    ${NOVO_CADASTRO_DE_USUARIO}
    clicar_elemento    ${BOTAO_SALVAR}
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]    O campo CPF é obrigatório   
    tirar_print    logs/prints_usuario    campos_vazios_cadastro_usuario_cpf
    fechar_navegador

#Falta as mensagens de alerta

cadastrar_diretoria
    [Tags]    CT04
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS}
    clicar_elemento    ${CAMPO_DIRETORIAS}
    clicar_elemento    ${BOTAO_CADASTRAR_DIRETORIA}
    ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria
    preencher_texto        ${CAMPO_NOME_NOVA_DIRETORIA}    ${NOME_DIRETORIA}  
    clicar_elemento    ${BOTAO_SALVAR}
    tirar_print    logs/prints_usuario    preencheu_cadastro_diretoria
    elemento_nao_visivel    ${ALERTA_DE_CAMPOS_INCORRETOS_DIRETORIA}
    fechar_navegador

campo_diretoria_sem_nome
    [Tags]    CT09
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS}
    clicar_elemento    ${CAMPO_DIRETORIAS}
    clicar_elemento    ${BOTAO_CADASTRAR_DIRETORIA}
    clicar_elemento    ${BOTAO_SALVAR}
    elemento_contem_texto    ${ALERTA_CAMPO_DIRETORIA_EM_BRANCO}    O campo diretoria é obrigatório 
    tirar_print    logs/prints_usuario    campo_diretoria_sem_nome
    fechar_navegador

editar_diretoria
    [Tags]    CT0e
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS}
    clicar_elemento    ${CAMPO_DIRETORIAS}
    