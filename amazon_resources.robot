*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
    options=add_experimental_option("detach", True)

Fechar o navegador
    Close Browser






