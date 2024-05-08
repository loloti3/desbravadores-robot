
*** Settings ***
Documentation    testes de login e cadastro de usuário
Resource          ../resources/main.robot


*** Test Cases ***
login_valido
    [Tags]    CT01
    abrir_navegador   
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL}
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD}
    tirar_print    preecheu_login.png
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_visivel    ${CAMPO_CADASTROS} 
    tirar_print    fez_login.png
    fechar_navegador
    
login_invalido
    abrir_navegador 
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL_INVALIDO}
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD_INVALIDO}
    clicar_elemento    ${BOTAO_ENTRAR} 
    elemento_contem_texto    ${MENSAGEM_CAMPO_INVALIDO}        E   
    tirar_print    preecheu_email_invalido-pagina.png   
    fechar_navegador

campo_email_e_senha_vazio
    abrir_navegador
    limpar_campo    ${CAMPO_LOGIN_EMAIL}
    limpar_campo    ${CAMPO_LOGIN_SENHA}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    //p[@class="css-18xtib3" and contains(text(),'A senha é obrigatória')]    A senha é obrigatória
    elemento_contem_texto    //p[@class="css-18xtib3" and contains(text(),'O email é obrigatório')]    O email é obrigatório
    fechar_navegador

campo_senha_vazio
    abrir_navegador
    preencher_texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL}
    limpar_campo    ${CAMPO_LOGIN_SENHA}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    //p[@class="css-18xtib3" and contains(text(),'A senha é obrigatória')]    A senha é obrigatória
    fechar_navegador

campo_email_vazio
    abrir_navegador
    preencher_texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD}
    clicar_elemento    ${BOTAO_ENTRAR}
    elemento_contem_texto    //p[@class="css-18xtib3" and contains(text(),'O email é obrigatório')]    O email é obrigatório
    fechar_navegador        

fazer_logout
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    tirar_print    fez_login_para_logout.png
    clicar_elemento    ${BOTAO_LOGOUT}
    elemento_visivel    ${BOTAO_ENTRAR}
    tirar_print    fez_logout.png
    fechar_navegador

cadastrar_usuario_com_sucesso
    [Tags]    CT01
    
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    id=Cadastros    
    clicar_elemento    //a[@href="/user"]
    elemento_visivel    //button[@id="edit"]    #SÓ PARA GARANTIR QUE ESTÁ NA PÁGINA DE CADASTRO DE USUÁRIO
    clicar_elemento    id=Novo Cadastro
    ${variavel_temporaria_nome}=    gerar_nome_aleatorio
    preencher_texto    id=fullName   ${variavel_temporaria_nome}
    ${variavel_temporaria_email}=    gerar_email_aleatorio
    preencher_texto    id=mail    ${variavel_temporaria_email}
    preencher_texto    id=accessProfil    ${TIPO_USUARIO}
    ${variavel_temporaria_cpf}=    gerar_cpf_aleatorio
    preencher_texto    id=cpf    ${variavel_temporaria_cpf}
    ${variavel_temporaria_password}=    gerar_password_aleatorio
    preencher_texto    ${CAMPO_LOGIN_SENHA}    ${variavel_temporaria_password}
    preencher_texto    id=confirmPassword    ${variavel_temporaria_password}
    clicar_elemento    id=save
    tirar_print    preencheu_cadastro_usuario.png
    elemento_nao_visivel    //div[@class="MuiAlert-message css-1xsto0d"]
    clicar_elemento    ${BOTAO_LOGOUT
    login_valido_keyword    ${variavel_temporaria_email}    ${variavel_temporaria_password}
    elemento_visivel    ${CAMPO_CADASTROS}
    fechar_navegador

campos_vazios_de _cadastrar_usuario   #os campos de senha não tem mesagem de erro por isso não os acresentei no teste
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    ${CAMPO_CADASTROS} 
    clicar_elemento    //a[@href="/user"]
    elemento_visivel    //button[@id="edit"]    
    clicar_elemento    id=Novo Cadastro
    clicar_elemento    id=save
    #separar os campos em campos
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo nome completo é obrigatório')]    O campo nome completo é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo email é obrigatório')]    O campo email é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo perfil de acesso é obrigatório')]    O campo perfil de acesso é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]    O campo CPF é obrigatório   
    tirar_print    campos_vazios_cadastro_usuario.png
    fechar_navegador
 


    
    

    

