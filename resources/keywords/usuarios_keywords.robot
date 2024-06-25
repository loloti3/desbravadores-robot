*** Settings ***
Documentation     keywords de teste de usuario

Resource          ../main.robot

*** Keywords ***
login valido keyword
    [Arguments]    ${EMAIL}    ${PASSWORD}
    abrir avegador   
    preencher email    ${EMAIL}
    preencher senha    ${PASSWORD}
    tirar print    logs/prints_login   preecheu_login
    clicar botao entrar
    validar login de sucesso
    tirar print    logs/prints_login    fez_login

clicar menu de cadastro
    clicar de forma repetida   ${CAMPO_CADASTROS} 

clicar em botao usuario  
    clicar elemento    ${BOTAO_USUARIOS}

botao editar usuario
    elemento visivel    ${BOTAO_EDITAR_USUARIOS}
    
clicar em botao criar novo usuario
    clicar elemento    ${NOVO_CADASTRO_DE_USUARIO}

preencher nome novo usuario
    [Arguments]   ${variavel_temporaria_nome}
    preencher texto    ${CAMPO_NOME_USUARIO}   ${variavel_temporaria_nome}

preencher email novo usuario
    [Arguments]    ${variavel_temporaria_email}
    preencher texto    ${CAMPO_EMAIL_USUARIO}    ${variavel_temporaria_email}

preencher acesso do usuario
    preencher texto    ${CAMPO_ACESSO_USUARIO}    ${TIPO_USUARIO}

preencher cpf novo usuario
    [Arguments]    ${variavel_temporaria_cpf}  
    preencher texto    ${CAMPO_CPF_USUARIO}    ${variavel_temporaria_cpf}    

preencher senha novo usuario
    [Arguments]    ${variavel_temporaria_password}
    preencher texto    ${CAMPO_LOGIN_SENHA}    ${variavel_temporaria_password}

preencher cofirmar senha novo usuario
    [Arguments]    ${variavel_temporaria_password}
    preencher texto    ${CAMPO_CONFIRMAR_SENHA_USUARIO}    ${variavel_temporaria_password}

clicar botao salvar
    clicar elemento    ${BOTAO_SALVAR}
    tirar print    logs/prints_usuario     preencheu_cadastro_usuario

validar cadastro de usuario com sucesso
    elemento nao visivel    ${ALERTA_DE_CAMPOS_INCORRETOS_USUARIOS}
    



