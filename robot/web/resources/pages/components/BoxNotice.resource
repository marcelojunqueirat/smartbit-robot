*** Settings ***
Documentation    Ações e elementos do componente de Caixa de Notificação

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${target}

    ${element}=    Set Variable    css=form .notice

    Wait For Elements State    
    ...    ${element}
    ...    state=visible    
    ...    timeout=5s

    Get Text  ${element}    equal    ${target}