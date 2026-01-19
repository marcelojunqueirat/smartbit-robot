*** Settings ***
Documentation    Ações de elementos da tela de envio de medidas

Library    AppiumLibrary

*** Keywords ***
Send weight and height
    [Arguments]    ${account}

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="myBodytTitle"]    timeout=10s

    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    text=${account}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    text=${account}[height]

    Click Element   xpath=//android.widget.TextView[@text="Enviar minhas medidas"]

