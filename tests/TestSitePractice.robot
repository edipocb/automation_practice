*** Settings ***
#Library     Selenium
Resource          ../resource/Resource.robot
#Suite Setup
Test Setup        Abrir navegador
#Suite Teardown
#Test Teardown     Fechar navegador  

### SETUP roda keyword antes da suite ou antes de um teste
### TEARDOWN roda keyword depois de uma suite ou um teste

*** Variables ***

*** Test Case ***
Cenário 01: Pesquisar produto existente
    #[Setup]    Abrir navegador firefox (Aqui dentro se torna mantatório)
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca
#   [Teardown]    Fechar navegador firefox (Aqui dentro se torna mantatório)
    
Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search ""itemNãoExistente"""

Cenário 03: Listar produto
    Dado que estou na página home do site
    Quando passo o mouse por cima da categoria "Women" no menu principal
    Então clico na sub categoria "Summer Dresses"

Cenário 04: Adicionar produtos no carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "T-shirt"
    E clicar no botão pesquisar
    E clico no botão Add to cart
    Então clico no botão Proceed to checkout

Cenário 05: Remover produto
    Dado que estou na página home do site
    E incluo o produto "T-shirt" no carrinho de compra
    Quando clico no ícone do carrinho de compras
    Então removo o produto do carrinho

Cenário 06: Adicionar Cliente
    Dado que estou na página home do site
    E confiro se os produtos da sub-categoria foram mostrados
    E clico no botão Sign in
    Quando insiro um e-mail válido
    E clico no botão create an account
    E prencho os campos obrigatórios
    # Então clico no botão "Register" e finalizo o cadastro 
       



#  *** Keywords ***