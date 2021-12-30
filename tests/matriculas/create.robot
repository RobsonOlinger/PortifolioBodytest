***Settings***
Documentation       Gestão de Matriculas

Resource            ${EXECDIR}/resources/resource.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Cenario: Deve exibir data inicial e final conforme o plano escolhido

        ${fixtures}             Get Json        matriculas-dates.json
        ${jhon}                 Set Variable            ${fixtures['students']}
        ${black}                Set Variable            ${fixtures['plan']}


       insert_student           ${jhon}
       insert_plan              ${black}


        nav.Go To Matriculas
        matriculas.Go To Form Matricula


        matriculas.Select Student               ${jhon['name']}
        matriculas.Select Plan                  ${black['title']}
  
        
       matriculas.Start Date Should Today
       matriculas.End Date Should Today         28/12/2022        




Cenario: Deve matricular um aluno em um plano



        ${fixtures}             Get Json                matriculas-create.json
        ${sara}                 Set Variable            ${fixtures['students']}
        ${fit}                  Set Variable            ${fixtures['plan']}


       insert_student           ${sara}
       insert_plan              ${fit}


        nav.Go To Matriculas
        matriculas.Go To Form Matricula


        matriculas.Select Student               ${sara['name']}
        matriculas.Select Plan                  ${fit['title']}


        matriculas.Submit Enrolls Form

        components.Toast Text Should Be  Matrícula cadastrada com sucesso

        [Teardown]              resource.Wating Screen Toast Alert and Take Screenshot  2