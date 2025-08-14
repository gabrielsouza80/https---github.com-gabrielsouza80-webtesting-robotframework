*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                         https://www.amazon.com.br/
${MENU_ELETRONICOS}            css:a[data-csa-c-content-id="nav_cs_electronics"]
${header_eletronicos}          xpath://h2//span[text() = 'Eletrônicos e Tecnologia']
${navega}                      xpath:(//a[contains(@class, 'a-carousel-goto-nextpage')]) [3]
${buttoniniciar}               css:button[type=submit]
${inputSearch}                 xpath://*[@id='twotabsearchtextbox']
${seachbutton}                 id:nav-search-submit-button

*** Keywords **
Abrir o navegador
    Open Browser   browser=chrome  
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    ${status}    ${msg}    Run Keyword And Ignore Error    Element Should Be Visible    ${BUTTON_INICIAR}    3s
    IF    '${status}' == 'PASS'
        Click Button    ${BUTTON_INICIAR}
        Log To Console    Botão clicado
    ELSE
        Log To Console    Botão não visível, seguindo fluxo
        Log To Console    ${msg}
    END

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${Frase}"
    Wait Until Page Contains    text=${Frase}
    Wait Until Element Is Visible    locator=${header_eletronicos}

Verificar se o título da página fica "${Titulo}"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Title Should Be    title=${Titulo}

alterar a nav
    Click Element    locator=${navega}

Verificar se aparece a categoria "${nameCategoria}"
    Wait Until Element Is Visible    locator=(//span[text()="${nameCategoria}"])[2]    timeout=10s
    Element Should Be Visible    locator=(//span[text()="${nameCategoria}"])[2]

Digitar o nome de produto "${Produto}" no campo de pesquisa
    Wait Until Element Is Visible    locator=${inputSearch}
    Input Text    locator=${inputSearch}    text=${Produto}    clear=${True}

Clicar no botão de pesquisa
    Click Button    locator=${seachbutton}
    
Verificar o resultado da pesquisa, se estar listando o ${produto} pesquisado
    Wait Until Page Contains   text=${produto}

Adicionar o produto "Console Xbox Series S" no carrinho



#### gherkin BDD  ####
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa


Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se estar listando o Xbox Series S pesquisado



 

 

