***Settings***
Documentation           Ações de componentes genericos



***Keywords***
### Validações ######################################################################################################################
Register Should Not Be Found
            
    Wait for elements State                    css=div >> text=Nenhum registro encontrado.                 visible         5
    #detached siguifica que não deve encontrar o elemnto css por 5 segundos
    Wait for elements State                    css=table                                                   detached        5



Total Items Should Be
    [Arguments]                  ${number}
    

     ${element}                  Set Variable                   css=#pagination .total 

     Wait For Elements State     ${element}                      visible                 5
     Get Text                    ${element}        ==            Total: ${number}      
     

Toast Text Should Be
    [Arguments]                             ${expect_text}

    Wait For Elements State                 css=.Toastify__toast-body >> text=${expect_text}         visible     5

Alert Text Should Be
    [Arguments]                             ${expect_text}

    Wait For Elements State                 css=form span >> text= ${expect_text}       visible     5

########### Return elemnetos ou textos #################################################################################################
Get Required Alerts
    [Arguments]     ${index}

    ${span}   Get Text      xpath=(//form//span)[${index}] 

    [return]     ${span}

# ver os tipo de elemntos dos campos se é texto, email ou name e etc
Field Should Be Type
    [Arguments]     ${element}          ${type}
    ${attr}         Get Attribute       ${element}     type
    Should Be Equal     ${attr}         ${type}



    