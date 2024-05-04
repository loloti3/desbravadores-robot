
*** Settings ***
Documentation    testes de login
Resource    ../resources/keywords/keywords_login.robot


*** Test Cases ***
login_valido
    abrir_navegador   
    Preencher_texto    id=email    5     ${EMAIL}
    Preencher_texto    id=password    5     ${PASSWORD}
    tirar print    preecheu_login.png
    clicar_elemento    id=login    5
    elemento_visivel    id=Cadastros    5
    tirar print    fez_login.png
    fechar_navegador
    
login_invalido
    abrir_navegador 
    Preencher_texto    id=email    5     ${EMAIL_INVALIDO}
    Preencher_texto    id=password    5     ${PASSWORD_INVALIDO}
    clicar_elemento    id=login    5 
    elemento_contem_texto    //div[@class='MuiAlert-message css-1xsto0d']    10        E   
    tirar print    preecheu_email_invalido-pagina.png   
    fechar_navegador

campo_email_senha_vazio
#Lembrar de separar os testes em 3 testes diferentes
    abrir_navegador
    #verificar se o campo de email e senha estão em branco
    limpar_campo    id=email    5
    limpar_campo    id=password    5
    clicar_elemento    id=login    5
    elemento_contem_texto    xpath=//p[@class="css-18xtib3" and contains(text(),'A senha é obrigatória')]    5    A senha é obrigatória
    elemento_contem_texto    xpath=//p[@class="css-18xtib3" and contains(text(),'O email é obrigatório')]    5    O email é obrigatório

    #verificar se o campo de email está em branco
    Preencher_texto    id=email    5     ${EMAIL}
    limpar_campo    id=password    5
    clicar_elemento    id=login    5
    elemento_contem_texto    xpath=//p[@class="css-18xtib3" and contains(text(),'A senha é obrigatória')]    5    A senha é obrigatória

    #verificar se o campo de senha está em branco
    limpar_campo    id=email    5
    Preencher_texto    id=password    5     ${PASSWORD}
    clicar_elemento    id=login    5
    elemento_contem_texto    xpath=//p[@class="css-18xtib3" and contains(text(),'O email é obrigatório')]    5    O email é obrigatório
    fechar_navegador        

fazer_logout
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    tirar print    fez_login_para_logout.png
    clicar_elemento    css=.css-1nvbq2d    5
    elemento_visivel    id=login    5
    tirar print    fez_logout.png
    fechar_navegador

cadastrar_usuario
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    id=Cadastros    5
    clicar_elemento    //a[@href="/user"]    5
    elemento_visivel    //button[@id="edit"]    5    #SÓ PARA GARANTIR QUE ESTÁ NA PÁGINA DE CADASTRO DE USUÁRIO
    clicar_elemento    id=Novo Cadastro    5
    preencher_texto    id=fullName    5    ${NOME_NOVO_USUARIO}
    preencher_texto    id=mail    5    ${EMAIL_NOVO_USUARIO}
    preencher_texto    id=accessProfile   5    ${TIPO_USUARIO}
    preencher_texto    id=cpf    5    ${CPF_NOVO_USUARIO}
    preencher_texto    id=password    5    ${PASSWORD_NOVO_USUARIO}
    preencher_texto    id=confirmPassword    5    ${PASSWORD_NOVO_USUARIO}
    tirar print    preencheu_cadastro_usuario.png
    clicar_elemento    id=cancel    5
    fechar_navegador

campos_vazios_de _cadastrar_usuario
    abrir_navegador
    login_valido_keyword    ${EMAIL}    ${PASSWORD}
    clicar_elemento    id=Cadastros    5
    clicar_elemento    //a[@href="/user"]    5
    elemento_visivel    //button[@id="edit"]    5    
    clicar_elemento    id=Novo Cadastro    5
    clicar_elemento    id=save    5
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo nome completo é obrigatório')]    5    O campo nome completo é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo email é obrigatório')]    5    O campo email é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo perfil de acesso é obrigatório')]    5    O campo perfil de acesso é obrigatório
    elemento_contem_texto    //p[@class="css-bbipig" and contains(text(),'O campo CPF é obrigatório')]    5    O campo CPF é obrigatório   
    tirar print    campos_vazios_cadastro_usuario.png
    fechar_navegador



    
    

    

