***Settings***
Documentation           Ações da feature de Gestão de Alunos



***Variables***
${NAME_FIELD}               css=input[name=name] 
${EMAIL_FIELD}              css=input[name=email] 
${AGE_FIELD}                css=input[name=age] 
${WEIGTH_FIELD}             css=input[name=weight]
${FEEET_TALL_FIELD}         css=input[name=feet_tall]
#


***Keywords***
### Keywords de Formularios     ########################################################################################

Fill New Students
    [Arguments]     ${students}
    Fill Text                       ${NAME_FIELD}            ${students.name}
    Fill Text                       ${EMAIL_FIELD}          ${students.email}
    Fill Text                       ${AGE_FIELD}             ${students.age}
    Fill Text                       ${WEIGTH_FIELD}            ${students.weight}
    Fill Text                       ${FEEET_TALL_FIELD}       ${students.feet_tall}

    Submit Student Form                          



Update Students
    [Arguments]     ${students}
    Fill Text                       ${NAME_FIELD}            ${students['name']}
    Fill Text                       ${EMAIL_FIELD}           ${students['email']}
    Fill Text                       ${AGE_FIELD}             ${students['age']}
    Fill Text                       ${WEIGTH_FIELD}          ${students['weight']}
    Fill Text                       ${FEEET_TALL_FIELD}      ${students['feet_tall']}

    Submit Student Form               


Seach Student By name
    [Arguments]         ${name}

    Fill Text           css=input[placeholder="Buscar aluno"]           ${name}



### Links e Botôes ########################################################################################
#clica no botao salvar ação
Submit Student Form
     Click                           xpath=//button[contains(text(),"Salvar")]


Go To Form New Student
    # quando der erro de não ler aparece strict coloca este codigo  (Set Strict Mode      false) para poder passar o teste
    Set Strict Mode                     false
    #botao de cadastro
    Click                           css=a[class$=glUTun]
    Wait For Elements State         css=h1 >> text=Novo aluno         visible     5


Request Removal By Email
    [Arguments]         ${email}
    Click               xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]


Cancel Removal
    Click                       text=NÃO


Confirm Removal
    Click                       text=SIM, pode apagar!



Go To Student Update Form
    [Arguments]         ${email}

     Click                           xpath=//td[contains(text(),"${email}")]/..//a[@class='edit']
     Wait For Elements State         css=h1 >> text=Edição de aluno         visible     5




###   Validações (Espera de elementos na tela)   ########################################################################################

Student Should be visible
    [Arguments]                 ${email}
    Wait for elements State     xpath=//td[contains(text(), "${email}")]        visible         5

Student Should be not visible
    [Arguments]                 ${email}
    Wait for elements State     xpath=//td[contains(text(), "${email}")]        detached        5


Student Name Should Be visible
    [Arguments]         ${name}

    #kEYWORD DA BROWSER WAIT FOR ELEMENT STATE |  css=table tbody tr >> text=${name} * css que combinado com o texto name do html sistema | >> siguinifica combinado com o texto name
    # Set Strict Mode              false
    Wait For Elements State      css=table tbody tr >> text=${name}         visible      5
