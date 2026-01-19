*** Settings ***
Documentation    Arquivo principal do projeto de teste automatizados para Mobile.

Library     AppiumLibrary
Library     JSONLibrary

Library     ../../libs/Database.py

Resource    ../../services/Service.resource

Resource    ./actions/login.resource
Resource    ./actions/account.resource
Resource    ./actions/mybody.resource
Resource    ./actions/components/menu.resource
Resource    ./actions/components/popup.resource

*** Variables ***
${REMOTE_URL}=     http://127.0.0.1:4723
${DEVICE_UDID}=    emulator-5554

*** Keywords ***
Start session

    Open Application     remote_url=${REMOTE_URL}    
    ...    platformName=Android    
    ...    automationName=UIAutomator2    
    ...    deviceName=Android    
    ...    udid=${DEVICE_UDID}
    ...    app=${EXECDIR}/app/smartbit-beta.apk    
    ...    autoGrantPermissions=true

    Wait Until Page Contains    text=IP da API    timeout=30s

Finish session

    Capture Page Screenshot
    Close Application


Get JSON fixture
    [Arguments]   ${scenario}
    
    ${data}=    Load Json From File    
    ...    ${CURDIR}/fixtures/data.json    
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]