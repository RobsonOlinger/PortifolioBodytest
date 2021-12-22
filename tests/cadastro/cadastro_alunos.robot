***Settings***
Documentation       Suite do Cadastro de alunos
Resource            ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Suite Setup         resource.Start Admin Session
Test Teardown       Take Screenshot





############################################################################################################################

***Test Cases***
cenario: Novo aluno
# pré condição

    &{students}     Create Dictionary       name=Consuelo Reis      email=consuelo@gmail.com        age=65       weight=110        feet_tall=1.70


   
    Remove Student                     ${students.email}              
    nav.Go To Page Students

    students.Go To Form New Student

    students.Fill New Students         ${students} 

    components.Toast Text Should Be    Aluno cadastrado com sucesso.    

    [Teardown]                         resource.Wating Screen Toast Alert and Take Screenshot  2



cenario: Menor de 14 anos não pode fazer cadastro

    &{students}     Create Dictionary       name=Livia da Silva      email=liviadasilva@gmail.com        age=13       weight=50        feet_tall=1.50

   
    Remove Student                      ${students.email}              
    nav.Go To Page Students

    students.Go To Form New Student

    students.Fill New Students          ${students} 
   
    components.Alert Text Should Be      A idade deve ser maior ou igual 14 anos

   


cenario: Não deve permitir email duplicado
    # [tags]          dup
    &{students}     Create Dictionary       name=Pietro Olinger      email=pv@gmail.com        age=14       weight=31        feet_tall=1.56


    #Insert Student é uma lib criada em Python para inserir um estudante do sistema via Banco, Lib Delorean
    Insert Student                     ${students} 
          
    nav.Go To Page Students

    students.Go To Form New Student

    students.Fill New Students          ${students} 
   
    components.Toast Text Should Be    Email já existe no sistema.

    [Teardown]                      resource.Wating Screen Toast Alert and Take Screenshot  2


cenario: Todos os campos devem ser obrigatórios
    # [tags]          all

    @{expected_alerts}              Set Variable     Nome é obrigatório      O e-mail é obrigatório     idade é obrigatória      o peso é obrigatório       a Altura é obrigatória
    @{got_alerts}                   Create List



    nav.Go To Page Students
    students.Go To Form New Student
    students.Submit Student Form

    


    #jeito de fazer
    # components.Alert Text Should Be      Nome é obrigatório
    # components.Alert Text Should Be      O e-mail é obrigatório
    # components.Alert Text Should Be      idade é obrigatória
    # components.Alert Text Should Be      o peso é obrigatório
    # components.Alert Text Should Be      a Altura é obrigatória


    #jeito pro de fazer Get Required Alerts e uma KW customizada e esta na actions
    FOR     ${index}       IN RANGE      1   6
          ${span}   Get Required Alerts     ${index} 
          Append To List        ${got_alerts}       ${span}

    END

    Log         ${expected_alerts}
    Log         ${got_alerts}


    Lists Should Be Equal            ${expected_alerts}      ${got_alerts}


cenario: Validar campos numericos 
    # [tags]          ty
    [Template]      Check Type Field On Student Form
    ${AGE_FIELD}             number        
    ${WEIGTH_FIELD}           number
    ${FEEET_TALL_FIELD}       number

cenario: Validar compo do tipo email
    # [tags]          ty
    [Template]      Check Type Field On Student Form
    ${EMAIL_FIELD}           email

# Check Age Numeric Field
#     [tags]              a
#     nav.Go To Page Students
#     students.Go To Form New Student
#     components.Field Should Be Number      css=input[name=age]

# Check weight Numeric Field
#     [tags]              a
#     nav.Go To Page Students
#     students.Go To Form New Student
#     components.Field Should Be Number       css=input[name=weight] 
    


# Check feet_tall Numeric Field
#     [tags]              a
#     nav.Go To Page Students
#     students.Go To Form New Student
#     components.Field Should Be Number      css=input[name=feet_tall]
   


***Keywords***
Check Type Field On Student Form
    [Arguments]         ${element}          ${type}
    Set Strict Mode                 false  #faz força para passar e encontrar os seletoes
    nav.Go To Page Students
    students.Go To Form New Student
    components.Field Should Be Type     ${element}      ${type}
