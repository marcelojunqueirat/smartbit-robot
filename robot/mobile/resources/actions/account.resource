*** Settings ***
Documentation    Ações de elementos da tela minha conta

Library    AppiumLibrary

*** Keywords ***
User is logged in

    ${element}=    Set Variable      xpath=//android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible    ${element}        timeout=10s

    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    expected=Sua transformação começa aqui!

    