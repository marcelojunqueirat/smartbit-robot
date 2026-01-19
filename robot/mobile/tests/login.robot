*** Settings ***
Documentation    Suíte de testes de login

Resource         ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com cpf e IP

    ${data}=    Get JSON fixture    login
    Insert Membership    ${data}

    Sigin with document  ${data}[account][cpf]
    User is logged in

Não deve logar com cpf não cadastrado

    Sigin with document  33883511048
    Popup have text    Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf digito inválido

    Sigin with document  00000014144
    Popup have text    CPF inválido, tente novamente



