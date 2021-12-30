***Settings***
Documentation       Suite do exclusão de alunos
Resource            ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Test Setup         resource.Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
cenario: Remover aluno cadastrado

       ${students}  Create Dictionary       name=Robert Pattison        email=batman@dc.com         age=29           weight=80        feet_tall=1.91

        Insert Student                                ${students} 
        nav.Go To Page Students
        students.Seach Student By name                ${students.name} 
        students.Request Removal By Email             ${students.email} 
        
        students.Confirm Removal                
        components.Toast Text Should Be               Aluno removido com sucesso.
        students.Student Should be not visible        ${students.email} 

        [Teardown]                  resource.Wating Screen Toast Alert and Take Screenshot  2



cenario: Desistir da exclusão

       ${students}  Create Dictionary       name=Robert Iron Man       email=ironman@marvel.com         age=40           weight=900       feet_tall=1.85

        Insert Student                                ${students} 
        nav.Go To Page Students
        students.Seach Student By name                ${students.name} 
        students.Request Removal By Email             ${students.email} 
        
        students.Cancel Removal
        students.Student Should be visible              ${students.email}

        [Teardown]                  resource.Wating Screen Toast Alert and Take Screenshot  2