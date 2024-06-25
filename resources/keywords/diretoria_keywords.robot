***settings***
*** Settings ***
Documentation    keywords de Diretoria

Resource    ../main.robot

*** Keywords ***
clicar botao diretoria
    clicar elemento    ${CAMPO_DIRETORIAS}

clicar botao cadastrar diretoria
    clicar elemento    ${BOTAO_CADASTRAR_DIRETORIA}

preencher nome diretoria
    [Arguments]    ${NOME_DIRETORIA}
    preencher texto        ${CAMPO_NOME_NOVA_DIRETORIA}    ${NOME_DIRETORIA}  

alerta de campo diretoria invalida
    elemento nao visivel    ${ALERTA_DE_CAMPOS_INCORRETOS_DIRETORIA}

clicar na seta que direciona para a ultima diretoria 
    rolar ate ficar visivel    ${SETA_ULTIMA_DIRETORIA}     
    clicar elemento    ${SETA_ULTIMA_DIRETORIA}
