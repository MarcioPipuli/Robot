*** Settings ***
Library        Browser

*** Variables ***
${BROWSER}         chromium
${HEADLESS}        ${false}

*** Keywords ***
Tirar Print
    Take Screenshot

Acessar "${SITE}"
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page       url=${SITE}

Selecionar opção "${OPCAO}"
    Select Options By    id=dropdown    text    ${OPCAO}

Obter frase de dentro do iFrame
    ${TEXTO}    Get Text    id=mce_0_ifr >>> id=tinymce
    Log    message=${TEXTO}

Conferindo valores em tabelas
    Click    id=table1 >> text=Last Name
    ${elemento}    Get Table Cell Element    id=table1    "First Name"    "fbach@yahoo.com"
    ${nome}    Get Text    ${elemento}    ==    Frank
    Log    ${NOME}

Clicar e ir para a nova página aberta
    Click    text="Click Here"
    Switch Page    NEW
    Get Text    h3    ==    New Window
    Tirar Print

Voltar para a página inicial
    [Arguments]    ${pagina_id}
    Switch Page    ${pagina_id}[0]
    Tirar Print