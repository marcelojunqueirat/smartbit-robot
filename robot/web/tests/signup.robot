*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Resource         ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}=    Create Dictionary    
    ...    name=Teixeira Marcelo    
    ...    email=marcelot@teste.com   
    ...    cpf=66633399901

    Delete Account By Email    ${account}[email]

    Submit sigup form    ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}         teixeira@teste.com    67249900099    Por favor informe o seu nome completo
    Marcelo Teste    ${EMPTY}              67249900099    Por favor, informe o seu melhor e-mail
    Marcelo Teste    teixeira@teste.com    ${EMPTY}       Por favor, informe o seu CPF
    Marcelo Teste    teste&teste.com       67249900099    Oops! O email informado é inválido
    Marcelo Teste    testsda123487.com     67249900099    Oops! O email informado é inválido
    Marcelo Teste    HUDAHDUDASDASDA       67249900099    Oops! O email informado é inválido
    Marcelo Teste    teixeira@teste.com    6724990009a    Oops! O CPF informado é inválido
    Marcelo Teste    teixeira@teste.com    672499         Oops! O CPF informado é inválido
    Marcelo Teste    teixeira@teste.com    $%¨&$$         Oops! O CPF informado é inválido
    Marcelo Teste    teixeira@teste.com    marcelocpf     Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}=    Create Dictionary    
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit sigup form    ${account}
    Notice should be     ${output_message}
