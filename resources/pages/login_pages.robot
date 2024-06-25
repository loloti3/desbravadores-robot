*** Settings ***
Documentation    Elementos de login

*** Variables ***

${CAMPO_LOGIN_EMAIL}    id=email
${CAMPO_LOGIN_SENHA}    id=password
${BOTAO_ENTRAR}          id=login
${MENSAGEM_CAMPO_INVALIDO}    //div[@class='MuiAlert-message css-1xsto0d']
${EMAIL_VAZIO_MENSAGEM}    //p[@class="css-18xtib3" and contains(text(),'O email é obrigatório')]          
${SENHA_VAZIA_MENSAGEM}    //p[@class="css-18xtib3" and contains(text(),'A senha é obrigatória')]
