*** Settings ***
Documentation    keywords de login

Resource    ../main.robot

*** Keywords ***

preencher email
    [Arguments]    ${EMAIL}
    preencher texto    ${CAMPO_LOGIN_EMAIL}     ${EMAIL}

preencher senha
    [Arguments]    ${PASSWORD}
    preencher texto    ${CAMPO_LOGIN_SENHA}     ${PASSWORD}
clicar botao entrar
    clicar elemento   ${BOTAO_ENTRAR}

validar login de sucesso
    elemento visivel    ${CAMPO_CADASTROS} 

mensagem de erro de login invalido
    elemento contem texto   ${MENSAGEM_CAMPO_INVALIDO}        E  

limpar campo email
    limpar campo    ${CAMPO_LOGIN_EMAIL}

limpar campo senha
    limpar campo    ${CAMPO_LOGIN_SENHA}

alerta de campo email vazio 
    elemento contem texto   ${EMAIL_VAZIO_MENSAGEM}    O email é obrigatório

alerta de campo senha vazio
    elemento contem texto   ${SENHA_VAZIA_MENSAGEM}    A senha é obrigatória

login valido
    login valido keyword    ${EMAIL}    ${PASSWORD}

clicar botao logout
    clicar elemento   ${BOTAO_LOGOUT}
