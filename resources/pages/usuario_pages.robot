*** Settings ***
Documentation    variaveis da pagina de novo usuario

*** Variables ***
${BOTAO_USUARIOS}    //a[@href="/user"]
${BOTAO_EDITAR_USUARIOS}    //button[@id="edit"]
${NOVO_CADASTRO_DE_USUARIO}    id=Novo Cadastro
${CAMPO_NOME_USUARIO}    id=fullName
${CAMPO_EMAIL_USUARIO}    id=mail
${CAMPO_ACESSO_USUARIO}    id=accessProfile
${CAMPO_CPF_USUARIO}    id=cpf
${CAMPO_CONFIRMAR_SENHA_USUARIO}    id=confirmPassword
${BOTAO_SALVAR}    id=save
${ALERTA_DE_CAMPOS_INCORRETOS_USUARIOS}    //div[@class="MuiAlert-message css-1xsto0d"]
${ALERTA_DE_USUARIO_CADASTRADO}    //div[@class="MuiAlert-message css-1xsto0d"]
${VARIAVEL_VAZIA}    {EMPTY}