*** Settings ***
Documentation    localização dos elementos de Diretoria 

*** Variables ***
${CAMPO_DIRETORIAS}    id=Diretorias  
${BOTAO_CADASTRAR_DIRETORIA}    id=Novo Cadastro
${CAMPO_NOME_NOVA_DIRETORIA}    id=boardName
${BOTAO_SALVAR}    id=save
${NOME_DIRETORIA}    ${EMPTY}
${ALERTA_DE_CAMPOS_INCORRETOS_DIRETORIA}    //div[@class="MuiAlert-message css-1xsto0d"]
${ALERTA_CAMPO_DIRETORIA_EM_BRANCO}        //p[@class="css-bbipig"]
${SETA_ULTIMA_DIRETORIA}    (//button[@class='css-kab9pu'])[2]
${QUANTIDADE_DIRETORIAS}    //ul[@class='css-76nm1l']/div/span
