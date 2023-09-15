*** Settings ***

Library    SeleniumLibrary

*** Variables ***

#dados do teste
${NomeDaMusica}    Ariana Grande

#variaveis de configuração
${URL}    https://www.youtube.com/
${Browser}    chrome

#elementos
${input_pesquisa}    //input[@id="search"]
${button_pesquisa}    //button[@id="search-icon-legacy"]
${primeiro}    (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${prova}     xpath=//*[@id="title"]/h1/yt-formatted-string

*** Keywords ***
Dado que acesso o site yt
    Open Browser    ${URL}    ${Browser}

Quando digito o nome da musica    
    Input Text    ${input_pesquisa}     ${NomeDaMusica} 
    Sleep    1s
    
E clico no botão buscar
    Click Element    ${button_pesquisa}

E clico na primeira opção da lista
    Wait Until Element Is Visible    ${primeiro}    10s
    Click Element    ${primeiro}

Então o video é executado
   Wait Until Element Is Visible    ${prova}       15
    Element Should Be Visible    ${prova}
    Sleep    1s

*** Test Cases ***
Cenario 1: Executar video no site do youtube
    Dado que acesso o site yt
    Quando digito o nome da musica    
    E clico no botão buscar
    E clico na primeira opção da lista
    Então o video é executado