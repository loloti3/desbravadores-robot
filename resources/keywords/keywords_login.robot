*** Settings ***

Library    SeleniumLibrary
Resource   ./../data/variables.robot

*** Keywords ***
abrir_navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size    1920    1080 

fechar_navegador
    Close Browser

preencher_texto
    [Arguments]      ${element}    ${time}    ${texto}
    Wait Until Element Is Visible    ${element}   ${time}
    Input Text    ${element}    ${texto}

elemento_visivel
    [Arguments]    ${element}    ${time}
    Wait Until Element Is Visible    ${element}    ${time}

clicar_elemento
    [Arguments]    ${element}    ${time}
    Wait Until Element Is Visible    ${element}    ${time}
    Click Element    ${element}

elemento_contem_texto
    [Arguments]    ${element}    ${time}    ${texto}
    Wait Until Element Is Visible    ${element}    ${time}
    Element Should Contain    ${element}    ${texto}

tirar print
    [Arguments]    ${nome}
    Capture Page Screenshot    ${nome}

limpar_campo
    [Arguments]    ${element}    ${time}
    Wait Until Element Is Visible    ${element}    ${time}
    Clear Element Text    ${element}

login_valido_keyword
    [Arguments]    ${email}    ${senha}
    preencher_texto    id=email    5    ${email}    
    preencher_texto    id=password    5    ${senha}    
    clicar_elemento    id=login    5    

    