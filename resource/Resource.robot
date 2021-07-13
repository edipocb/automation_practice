*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com
&{USUARIO}          nome=Teste   sobrenome=Etset    email=edipo@gmail.com
@{SUBCATEGORIA}     Printed Dress      Printed Summer Dress     Printed Chiffon Dress      


*** Keywords ***
# Setup e Teardown
Abrir navegador
    Open Browser    about:blank    ${BROWSER}

Fechar navegador
    Close Browser

# Passo-a-Passo
Dado que estou na página home do site
    Go To   http://automationpractice.com 
    Title Should Be     My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
   Input Text       id=search_query_top    "${PRODUTO}"
   Click Element    name=submit_search

# Conferências

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
    
 
Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"   
    Wait Until Element Is Visible   //*[@id="center_column"]//p[@class="alert alert-warning"]
    Element Text Should Be          //*[@id="center_column"]//p[@class="alert alert-warning"]   ${MENSAGEM_ALERTA}
    
Quando passo o mouse por cima da categoria "${CATEGORIA}" no menu principal
    Mouse Over      xpath=//*[@id="block_top_menu"]//a[@title="Women"]

Então clico na sub categoria "Summer Dresses"    
    Click Element       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a  
    Title Should Be     Summer Dresses - My Store

E clicar no botão pesquisar
    Click Element    name=submit_search

E clico no botão Add to cart
    Mouse Over      xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/1-home_default.jpg"] 
    #Wait Until Element Is Visible       //a[@class="button ajax_add_to_cart_button btn btn-default"]   
    Click Element   //a[@class="button ajax_add_to_cart_button btn btn-default"]
    
Então clico no botão Proceed to checkout    
   Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]//div[@class="layer_cart_cart col-xs-12 col-md-6"] 
   Click Element                    xpath=//a[@class="btn btn-default button button-medium"]   
    

E incluo o produto "${PRODUTO}" no carrinho de compra
   Input Text                       id=search_query_top    "${PRODUTO}"
   Click Element                    name=submit_search
   Mouse Over                       xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/1-home_default.jpg"] 
    #Wait Until Element Is Visible       //a[@class="button ajax_add_to_cart_button btn btn-default"]   
   Click Element                    //a[@class="button ajax_add_to_cart_button btn btn-default"] 
   Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]//div[@class="layer_cart_cart col-xs-12 col-md-6"]
   Click Element                    xpath=//*[@id="layer_cart"]//span[@title="Continue shopping"]

Quando clico no ícone do carrinho de compras
   Mouse Over         xpath=//*[@id="header"]//a[@title="View my shopping cart"]

Então removo o produto do carrinho
   Click Element     xpath=//*[@id="header"]//a[@class="ajax_cart_block_remove_link"]  

E clico no botão Sign in
    Click Element   xpath=//*[@id="header"]//a[@class="login"]   

E confiro se os produtos da sub-categoria foram mostrados   
    Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[2]/a
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="${SUBCATEGORIA[0]}"]
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="${SUBCATEGORIA[1]}"]
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[5]/div/div[2]/h5/a[@title="${SUBCATEGORIA[2]}"]
Quando insiro um e-mail válido
    Input Text  xpath=//*[@id="email_create"]   edipocb@gmail.com

E clico no botão create an account
    Click Element   xpath=//*[@id="SubmitCreate"]

E prencho os campos obrigatórios
    Wait Until Element Is Visible               //*[@id="account-creation_form"]/div[1]/h3   
    Click Element                               xpath=//*[@id="account-creation_form"]//label[@for="id_gender1"]                   
    Input Text                                  xpath=//*[@id="customer_firstname"]     ${USUARIO.nome}
    Input Text                                  xpath=//*[@id="customer_lastname"]      ${USUARIO.sobrenome}
    Clear Element Text                          xpath=//*[@id="email"]
    Input Text                                  xpath=//*[@id="email"]                  ${USUARIO.email}
    Click Element                               xpath=//*[@id="email"]
    Input Text                                  xpath=//*[@id="passwd"]                 TesteTeste
    Click Element                               xpath=//*[@id="days"]/option[6]
    Click Element                               xpath=//*[@id="months"]/option[10]
    Click Element                               xpath=//*[@id="years"]/option[36]
    Click Element                               xpath=//*[@id="newsletter"]    
    Input Text                                  xpath=//*[@id="firstname"]              Testes
    Input Text                                  xpath=//*[@id="lastname"]               Setset
    Input Text                                  xpath=//*[@id="address1"]               TesteSetset
    Input Text                                  xpath=//*[@id="city"]                   Jackson           
    Click Element                               xpath=//*[@id="id_state"]/option[26]
    Input Text                                  xpath=//*[@id="phone_mobile"]           55 11 99999999
    Input Text                                  xpath=//*[@id="alias"]                  Test Test    