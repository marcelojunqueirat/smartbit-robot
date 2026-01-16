*** Settings ***
Documentation    Suíte de testes de adesões de planos

Resource         ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    ${data}=    Get JSON fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]  
    
    SignIn admin
    Go to memberships
    Create new membership    ${data}

    Toast should be    Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada
    [Tags]    dup
    
    ${data}=    Get JSON fixture    memberships    duplicate

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]
    Insert Membership          ${data}
    
    SignIn admin
    Go to memberships
    Create new membership    ${data}

    Toast should be    O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search

    ${data}=    Get JSON fixture    memberships    search
    Insert Membership          ${data}

    SignIn admin
    Go to memberships
    Search by name    ${data}[account][name]
    
    Should filter by name    ${data}[account][name]

Deve excluir uma matricula
    [Tags]    remove

    ${data}=    Get JSON fixture    memberships    remove
    Insert Membership          ${data}

    SignIn admin
    Go to memberships
    Request removal by name    ${data}[account][name]
    Confirm removal

    Membership should not be visible    ${data}[account][name]
