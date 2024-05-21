*** Settings ***

Resource    ../main.robot
Documentation    Variaveis Globais
*** Variables ***
#TENHO QUE PADRONIZAR AS VARIAVEIS
${URL}    https://automacao.qacoders-academy.com.br/login
${EMAIL}    sysadmin@qacoders.com

${PASSWORD}    1234@Test
${EMAIL_INVALIDO}    sysadmin@ders.com
${PASSWORD_INVALIDO}    1234@Tes1
${TIPO_USUARIO}    ADMIN

#variaveis navegador

${chrome}    Chrome
${firefox}    Firefox
${edge}    Edge
${headlesschrome}    headlesschrome

#variaveil de tempo de espera de execusão 
${TIME_GERAL}    30



