*** Settings ***
Documentation    Ações e elementos da tela de login

Library    AppiumLibrary

*** Keywords ***
Sigin with document
    [Arguments]    ${cpf}
    Input Text    
    ...    xpath=//android.widget.EditText[@resource-id="ipAddress"]    
    ...    text=192.168.127.8
    Input Text    
    ...    xpath=//android.widget.EditText[@resource-id="cpf"]          
    ...    text=${cpf}

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]