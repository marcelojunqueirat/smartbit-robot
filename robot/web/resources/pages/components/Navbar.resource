*** Settings ***
Documentation    Ações e elementos do componente da barra de navegação

Library    Browser

*** Keywords ***
Go to memberships
    Click    css=a[href="/memberships"]

    Wait For Elements State    
    ...    css=h1 >> text=Matrículas    
    ...    visible    
    ...    5s

User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    visible    5s
    Get Text                   ${element}    equal    ${email}

