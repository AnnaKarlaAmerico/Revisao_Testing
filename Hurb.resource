*** Variables ***
${SITE}                 http://hurb.com/br
${NAVEGADOR}            chrome
${COOKIES}              css=#CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
${PACOTES}              css=#__next > div.Header_Header__1jiZz > div.hrc-2LOsj > div > div > div.h-rwgu8t > div > div > button:nth-child(2) > span
${CAMPO_CIDADE}         css=#destination-input
${CIDADE}               Brasília
${PESQUISAR}            css=#__next > div.Header_Header__1jiZz > div.hrc-2LOsj > div > div > div.h-rr9hdz > button > span
${SELECIONAR_PACOTE}    css=#__next > div > main > div.ResultsCardsContainer_ResultsCardContainer__1jtiB > a > div.hrc-2MRhP.h-1tms90c > div:nth-child(1) > h3
${ESCOLHER_OPCAO}       css=body > div:nth-child(4) > section > div.box-offer-top.box-nopadding.col-sm-6.col-md-6 > div > section.box-offer-main.pull-left > div:nth-child(5) > div.pull-left.first-box > button
${COMPRAR}              css=#offer-options > div.offer-options--items.small-margin-top > div:nth-child(4) > div.row.flex > div.col-xs-12.col-sm-4.col-md-4.offer-options--box-right.main-package > div > div.col-xs-12.col-sm-7.col-md-7.offer-options--box.offer-options--box-price.flex > div:nth-child(2) > div:nth-child(4) > a
${BOLETO_PARCELADO}     css=#ui-id-1 > span
${CAMPO_NOME}           css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(1) > div > input
${NOME}                 Felipe
${CAMPO_CPF}            css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(2) > div > input  
${CPF}                  00000000000
${CAMPO_CELULAR}        css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(3) > div > input  
${CELULAR}              61999999999
${CHECKBOX}             css=#cancellation-policy


*** Keywords ***
Abrir o site do Hurb
  Open Browser              ${SITE}             ${NAVEGADOR}
  Maximize Browser Window

Clicar em "Permitir todos os cookies"
  Sleep  5
  Click Element             ${COOKIES}
        
Selecionar a opção "Pacotes"
  Click Element             ${PACOTES}

Buscar por alguma cidade turística (Ex: Buenos Aires, Florença, Orlando) e clicar em "Pesquisar"
  Input Text                ${CAMPO_CIDADE}     ${CIDADE}
  Click Element             ${PESQUISAR}

Selecionar um pacote de viagem
  Click Element             ${SELECIONAR_PACOTE}   
  Switch Window             NEW    

Clicar em "ESCOLHER OPÇÃO"
  Click Element             ${ESCOLHER_OPCAO}
  Sleep   3

Escolher uma opção de viagem e clicar em "COMPRAR"
  Click Element             ${COMPRAR}

Validar as informações da "Configuração" da viagem
  Sleep   5
  Page Should Contain       5 Noites
  Page Should Contain       1 pessoa por pacote

Validar as informações do período da viagem
  Page Should Contain       25 Fev 2022
  Page Should Contain       02 Mar 2022
  
Selecionar a opção "Boleto parcelado"
  Click Element             ${BOLETO_PARCELADO}

Preencher os dados de pagamento
  Input Text                ${CAMPO_NOME}        ${NOME}
  Input Text                ${CAMPO_CPF}         ${CPF}
  Input Text                ${CAMPO_CELULAR}     ${CELULAR}
  
Marcar o checkbox "Li e aceito as condições de termos de uso e política de privacidade"
  Select Checkbox           ${CHECKBOX}

Validar a informação sobre cancelamento grátis
  Page Should Contain       Cancelamento Grátis! 
  
Fechar o navegador
  Close Browser

Wait and Click
  [Arguments]                       ${ELEMENTO}  ${TEMPO}
  Wait Until Element is Visible     ${ELEMENTO}  ${TEMPO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Scroll Element Into View          ${ELEMENTO}
  Click Element                     ${ELEMENTO}

Wait and Input Text
  [Arguments]                       ${ELEMENTO}  ${TEXTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Scroll Element Into View          ${ELEMENTO}
  Input Text                        ${ELEMENTO}  ${TEXTO}