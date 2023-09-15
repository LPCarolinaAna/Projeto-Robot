*** Settings ***

Library    SeleniumLibrary

*** Variables ***

#Dados do site
${URL}            https://www.cea.com.br/
${Browser}        chrome
${Cookies}        //button[@id="onetrust-accept-btn-handler"]

#Dados do login e senha
${Click_button_Minhaconta}      xpath=/html/body/div[2]/div/div[1]/div/div[2]/div/div/section/div/div[3]/div/div/div/div/p[1]
${click_entrar}                 //div[contains(text(),"entrar")]
${Entrar_com_emailEsenha}       //div[.="Entrar com email e senha"]/span
${Input_email}                  xpath=/html/body/div[2]/div/div[1]/div/div[4]/div/div/div/div[2]/div/div/form/div[1]/label/div/input
${Input_passoword}              xpath=/html/body/div[2]/div/div[1]/div/div[4]/div/div/div/div[2]/div/div/form/div[2]/div/label/div/input       
${Click_confirmar}              xpath=/html/body/div[2]/div/div[1]/div/div[4]/div/div/div/div[2]/div/div/form/div[4]/div/button/div/span

*** Test Cases ***
Acessar o site e criar conta
    Dado que o usuario acesse o site da CeA
    E aceitar o cookies
    Entao efetua o login

#Buscar Produto e adicionar item na sacola
#    Dado a busca do produto camisa
#    Quando localizado o item
#    E clicar em busca
#    E escolhido o tamanho 
#    Então o item é adicionado na sacola

*** Keywords ***

Dado que o usuario acesse o site da CeA
    Open Browser   ${URL}    ${Browser}

E aceitar o cookies
    Click Element    ${Cookies}

Entao efetua o login
    Click Element    ${Click_button_Minhaconta} 
    Click Element    ${click_entrar}     
    Wait Until Element Is Visible    ${Entrar_com_emailEsenha}      10s
    Click Element    ${Entrar_com_emailEsenha}   
    Input Text         ${Input_email}    ana1234teste@gmail.com
    Input Text         ${Input_passoword}      @CeA1234
    Click Element      ${Click_confirmar}  
    