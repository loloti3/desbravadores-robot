*** Settings ***
Documentation    Estrutura do projeto em pastas

Library    SeleniumLibrary
Library    String
#variaveis globais
Resource   data/variables.robot
#variaveis pages
Resource   pages/login_pages.robot
Resource   pages/home_pages.robot
Resource   pages/novo_usuario.robot
#keywords
Resource    ./keywords/keywords_login.robot
Resource    ./utils/keywords_utils.robot