***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}              id=title
${DURATION_FIELD}           id=duration
${PRICE_FIELD}              css=input[name=price]
${TOTAL_FIELD}              css=input[name=total]
${BOTAO_SALVAR_PLAN}        xpath=//button[contains(text(), "Salvar")]
${BOTAO_CADASTRAR_PLANO}    css=a[href$="planos/new"]


***Keywords***
## Forms
Submit Plan Form
    Click           ${BOTAO_SALVAR_PLAN}

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}        ${plan.title}
    Fill Text       ${DURATION_FIELD}     ${plan.duration}
    Fill Text       ${PRICE_FIELD}        ${plan.price}

    Submit Plan Form



Update Plan Form
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}         ${plan['title']}
    Fill Text       ${DURATION_FIELD}      ${plan['duration']}
    Fill Text       ${PRICE_FIELD}         ${plan['price']}


    Submit Plan Form

## Links & Buttons
Go To Form Plan
    Set Strict Mode                     false
    Click       ${BOTAO_CADASTRAR_PLANO}
    Wait For Elements State     css=h1 >> text=Novo plano     visible     5

## Validations
Total Plan Should Be
   [Arguments]                  ${number}
    

     ${element}                  Set Variable                   css=#pagination .total 

     Wait For Elements State     ${element}                      visible                 5
     Get Text                    ${element}        ==            Total: ${number}      
     

Seach Plan By Title
    [Arguments]         ${title}

    Fill Text           css=input[placeholder="Buscar plano"]           ${title}


Request Removal By Title
    [Arguments]         ${title}
    Click               xpath=//td[contains(text(), "${title}")]/../td//button[@id="trash"]


Confirm Removal
    Click                       text=SIM, pode apagar!

Plans Should be not visible
    [Arguments]                 ${title}
    Wait for elements State     xpath=//td[contains(text(), "${title}")]        detached        5


Cancel Removal
    Click                       text=NÃO


Plans Should be visible
    [Arguments]                 ${title}
    Wait for elements State     xpath=//td[contains(text(), "${title}")]        visible         5


Go To Plan Update Form
    [Arguments]         ${title}

     Click                           xpath=//td[contains(text(),"${title}")]/..//a[@class='edit']
     Wait For Elements State         css=h1 >> text=Edição de plano         visible     5
