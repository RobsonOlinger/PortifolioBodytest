***Settings***
Documentation       Buscar alunos
Resource            ${EXECDIR}/resources/resource.robot


# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Suite Setup         resource.Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
cenario: Busca Exata
    
    &{students}     Create Dictionary       name=Steven Jobs      email=jobs@aplle.com	       age=50       weight=80       feet_tall=1.79

# ações
   
    Remove Student By Name                      ${students.name}
    Insert Student                              ${students} 
    nav.Go To Page Students
    students.Seach Student By name              ${students.name}

#validação
    Student Name Should Be visible              ${students.name}
    Total Items Should Be                       1


Cenario: Registro não encontrado
    
    ${name}             Set Variable            Barão Zeno

    Remove Student By Name                      ${name}
    nav.Go To Page Students
    students.Seach Student By name              Barão Zeno   
    components.Register Should Not Be Found


Cenario: Busca alunos por um unico termo
#este cenario usa a library da OperatingSystem que esta na resource.robot pra poder usar json
    [tags]          file
   
    ${fixture}          Get Json            students-seach.json

    ${students}         Set Variable        ${fixture['students']}

    ${word}             Set Variable        ${fixture['word']}
    ${total}            Set Variable        ${fixture['total']}

    Remove Student By Name      David

    #laço for que anda e ver os nomes na lista students no arquivo json, se @ porque é uma lista
    FOR     ${item}     IN      @{students}
        Insert Student          ${item}

    END

    
    Go To Page Students
    Seach Student By name      ${word} 




    FOR     ${item}     IN      @{students}
        Student Name Should Be visible              ${item['name']}

    END


    Total Items Should Be                ${total}


    Sleep                       5




















