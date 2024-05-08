*** Settings ***

Resource      ../main.robot

*** Keywords ***
abrir_navegador
    Open Browser    ${URL}    ${headlesschrome}
    Set Window Size    1920    1080  

clicar_elemento
    [Arguments]    ${element}    
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Click Element    ${element}

fechar_navegador
    Close Browser

preencher_texto
    [Arguments]      ${element}    ${texto}
    Wait Until Element Is Visible    ${element}   ${TIME_GERAL}
    Input Text    ${element}    ${texto}

elemento_visivel
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}

elemento_nao_visivel
    [Arguments]    ${element}
    Wait Until Element Is Not Visible    ${element}    ${TIME_GERAL}


elemento_contem_texto
    [Arguments]    ${element}    ${texto}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Element Should Contain    ${element}    ${texto}

tirar_print
    [Arguments]    ${nome}
    Capture Page Screenshot    ${nome}

limpar_campo
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Clear Element Text    ${element}

login_valido_keyword
    [Arguments]    ${email}    ${senha}
    preencher_texto    ${CAMPO_LOGIN_EMAIL}    ${email}    
    preencher_texto    ${CAMPO_LOGIN_SENHA}    ${senha}    
    clicar_elemento    ${BOTAO_ENTRAR}





