*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://automacao.qacoders-academy.com.br/login
${BROWSER}    Chrome
${EMAIL}    sysadmin@qacoders.com
${PASSWORD}    1234@Test
${EMAIL_INVALIDO}    sysadmin@ders.com
${PASSWORD_INVALIDO}    1234@Tes
${EMAIL_NOVO_USUARIO}    lulu@juju.com
${PASSWORD_NOVO_USUARIO}    1234@Tes
${NOME_NOVO_USUARIO}    Lulu Juju
${CPF_NOVO_USUARIO}    11999999999
${TIPO_USUARIO}    admin