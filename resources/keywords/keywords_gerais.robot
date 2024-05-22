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
    [Arguments]    ${pasta}   ${nome}
    Set Screenshot Directory    ${pasta}   
    Capture Page Screenshot    ${nome}.png

limpar_campo
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Clear Element Text    ${element}

login_valido_keyword
    [Arguments]    ${email}    ${senha}
    preencher_texto    ${CAMPO_LOGIN_EMAIL}    ${email}    
    preencher_texto    ${CAMPO_LOGIN_SENHA}    ${senha}    
    clicar_elemento    ${BOTAO_ENTRAR}

rolar_barra
    [Arguments]    ${element}
    Scroll Element Into View    ${element}   

rolar_ate_acontecer
    [Arguments]    ${repeticoes}    ${element}
    Wait Until Keyword Succeeds    1    ${repeticoes}    Scroll Element Into View    ${element}    

clicar_elemento_com_repeticao
    [Arguments]    ${element}    
    Wait Until Keyword Succeeds    1    2    clicar_elemento    ${element}     


