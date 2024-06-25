
*** Settings ***
Documentation    testes de login e cadastro de usuário e diretoria
Resource          ../resources/main.robot

*** Test Cases ***
#Lembrar de separar os testes em pastas 
login_valido
    [Tags]    T1    CT01
    abrir avegador   
    preencher email    ${EMAIL}
    preencher senha    ${PASSWORD}
    tirar print    logs/prints_login   preecheu_login
    clicar botao entrar
    validar login de sucesso
    tirar print    logs/prints_login    fez_login
    fechar navegador
    
login_invalido
    [Tags]    T2    CT01
    abrir avegador 
    preencher email    ${EMAIL_INVALIDO}
    preencher senha    ${PASSWORD_INVALIDO}
    clicar botao entrar
    mensagem de erro de login invalido  
    tirar print    logs/prints_login    preecheu_email_invalido-pagina              
    fechar navegador

campo_email_e_senha_vazio
    [Tags]    T3    CT01
    abrir avegador
    limpar campo email    
    limpar campo senha
    clicar botao entrar
    alerta de campo email vazio
    alerta de campo senha vazio
    fechar navegador

campo_senha_vazio
    [Tags]    T4    CT01
    abrir avegador
    preencher email    ${EMAIL}
    limpar campo senha
    clicar botao entrar
    alerta de campo senha vazio
    fechar navegador

campo_email_vazio
    [Tags]    T5    CT01
    abrir avegador
    limpar campo email
    preencher senha    ${PASSWORD}
    clicar botao entrar
    alerta de campo email vazio
    fechar navegador        

fazer_logout
    [Tags]    T6    CT02 
    abrir avegador
    login valido
    tirar print    logs/prints_home    fez_login_para_logout
    clicar botao logout
    clicar botao entrar
    tirar print    logs/prints_home     fez_logout
    fechar navegador

cadastrar_usuario_com_sucesso
    [Tags]    T7    CT03 

    ${variavel_temporaria_nome}=     gerar_nome_aleatorio
    ${variavel_temporaria_email}=    gerar_email_aleatorio
    ${variavel_temporaria_cpf}=    gerar_cpf_aleatorio
    ${variavel_temporaria_password}=    gerar_password_aleatorio

    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario
    clicar em botao criar novo usuario
    preencher nome novo usuario    ${variavel_temporaria_nome}
    preencher email novo usuario    ${variavel_temporaria_email}
    preencher acesso do usuario
    preencher cpf novo usuario    ${variavel_temporaria_cpf}            
    preencher senha novo usuario    ${variavel_temporaria_password}
    preencher cofirmar senha novo usuario    ${variavel_temporaria_password}
    clicar botao salvar
    validar cadastro de usuario com sucesso 
    clicar botao logout
    login valido keyword    ${variavel_temporaria_email}    ${variavel_temporaria_password}
    tirar print    logs/prints_usuario    preencheu_login_novo_usuario
    # elemento visivel    ${CAMPO_CADASTROS}

campos_nome_vazio_de _cadastrar_usuario   
    [Tags]    T8    CT03
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo nome completo é obrigatório')]    O campo nome completo é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_nome
    fechar navegador

campos_email_vazio_de _cadastrar_usuario 
    [Tags]    T9    CT03
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo email é obrigatório')]    O campo email é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_email
    fechar navegador

campo_perfil_vazio_de_cadastrar_usuario
    [Tags]    T10    CT03
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo perfil de acesso é obrigatório')]    O campo perfil de acesso é obrigatório
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_perfil
    fechar navegador

campo_cpf_vazio_de_cadastrar_usuario
    [Tags]    T11    CT03
    abrir avegador
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro
    clicar em botao usuario  
    clicar em botao criar novo usuario 
    clicar botao salvar
    elemento visivel     //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]
    elemento contem texto    //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]    O campo CPF é obrigatório   
    tirar print    logs/prints_usuario    campos_vazios_cadastro_usuario_cpf
    fechar navegador

#Falta as mensagens de alerta

cadastrar_diretoria
    [Tags]    T12    CT04

    ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria

    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro 
    clicar botao diretoria
    clicar botao cadastrar diretoria
    preencher nome diretoria    ${NOME_DIRETORIA}  
    clicar botao salvar
    tirar print    logs/prints_diretoria    preencheu_cadastro_diretoria
    alerta de campo diretoria invalida
    fechar navegador

campo_diretoria_sem_nome
    [Tags]    T13    CT09
    login valido keyword    ${EMAIL}    ${PASSWORD}
    clicar menu de cadastro 
    clicar botao diretoria
    clicar botao cadastrar diretoria 
    clicar botao salvar
    elemento contem texto    ${ALERTA_CAMPO_DIRETORIA_EM_BRANCO}    O campo diretoria é obrigatório 
    tirar print    logs/prints_diretoria   diretoria_sem_nome
    fechar navegador

editar_diretoria
    # Este teste foi um desafio, queria validar a edição/criação de uma diretoria, mas o campo pesquisa não funciona então tive
    # que ir até o ultimo elemento da tabela e edita-lo todas as novas diretorias criadas ficam na ultima posição da tabela assim 
    # posso verificar se a diretoria foi criada e também se consigo edita-la, futuramente pretento integrar os dois testes para testar
    # melhor o fluxo ainda não fiz isso nem ecapsulei pois pretendo melhorar os meus testes.
    [Tags]    T14    CT04

    ${NOME_DIRETORIA}=    gerar_nome_aleatorio_diretoria

    login valido keyword    ${EMAIL}    ${PASSWORD} 
    clicar menu de cadastro 
    clicar botao diretoria
    clicar na seta que direciona para a ultima diretoria
    ${CODIGO_ULTIMA_DIRETORIA}=    Get Text    ${QUANTIDADE_DIRETORIAS}
    rolar ate ficar visivel    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]
    tirar print    logs/prints_diretoria   RolouParaUltimaDiretoria
    clicar elemento    //ul[@class="css-18psgb0"]/li[div/p[text()="${CODIGO_ULTIMA_DIRETORIA}"]]/div/button[@id="edit"]    
    limpar_campo    ${CAMPO_NOME_NOVA_DIRETORIA}  
    preencher texto    ${CAMPO_NOME_NOVA_DIRETORIA}    ${NOME_DIRETORIA}
    clicar elemento    ${BOTAO_SALVAR} 
    rolar ate ficar visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]          
    elemento visivel    //p[text()="${CODIGO_ULTIMA_DIRETORIA}"]/ancestor::li//p[contains(text(), "${NOME_DIRETORIA}")]    
    tirar print     logs/prints_diretoria   editar_diretoria
    fechar navegador