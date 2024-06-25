*** Settings ***

Resource      ../main.robot

*** Keywords ***
abrir avegador
    Open Browser    ${URL}    ${headlesschrome} 
    Set Window Size    1920    1080  

clicar elemento
    [Arguments]    ${element}    
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Click Element    ${element}

fechar navegador
    Close Browser

preencher texto
    [Arguments]      ${element}    ${texto}
    Wait Until Element Is Visible    ${element}   ${TIME_GERAL}
    Input Text    ${element}    ${texto}

elemento visivel
    [Arguments]    ${element} 
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}

elemento nao visivel
    [Arguments]    ${element}
    Page Should Not Contain   ${element} 
    Wait Until Element Is Not Visible    ${element}    ${TIME_GERAL}


elemento contem texto
    [Arguments]    ${element}    ${texto}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Element Should Contain    ${element}    ${texto}

tirar print
    [Arguments]    ${pasta}   ${nome}
    Set Screenshot Directory    ${pasta}   
    Capture Page Screenshot    ${nome}.png

limpar campo
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    ${TIME_GERAL}
    Clear Element Text    ${element}

rolar
    [Arguments]    ${element}
    Scroll Element Into View    ${element}   

rolar ate ficar visivel
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${repeticoes}    1    Scroll Element Into View    ${element}    

clicar de forma repetida
    [Arguments]    ${element}    
    Wait Until Keyword Succeeds    ${repeticoes}    1    clicar_elemento    ${element}    


