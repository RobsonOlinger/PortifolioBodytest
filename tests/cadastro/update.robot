***Settings***
Documentation       Atualizar alunos
Resource            ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Suite Setup         resource.Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
cenario: Atualizar um aluno ja cadastrado

    ${fixture}          Get Json  students-update.json   

    ${kamalakan}         Set Variable    ${fixture['before']}
    ${missmarvel}        Set Variable    ${fixture['after']}

    Remove Student By Name                          ${kamalakan['name']}
    Remove Student By Name                          ${missmarvel['name']}


    Insert Student                                  ${kamalakan}

    Go To Page Students
    Seach Student By name                           ${kamalakan['name']}

    students.Go To Student Update Form              ${kamalakan['email']}
    students.Update Students                        ${missmarvel}

    Toast Text Should Be                            Aluno atualizado com sucesso.         
   
   [Teardown]                                       resource.Wating Screen Toast Alert and Take Screenshot  2


