***Settings***
Documentation       Atualizar planos
Resource            ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste

Suite Setup         resource.Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
cenario: Atualizar um plano ja cadastrado

    ${fixture}          Get Json  plans-update.json   

    ${robson}         Set Variable     ${fixture['before']}
    ${souza}          Set Variable     ${fixture['after']}

    remove_plan_by_title                          ${robson['title']}
    remove_plan_by_title                          ${souza['title']}


    insert_plan                                   ${robson}

    nav.Go To Plans
    plans.Seach Plan By Title                     ${robson['title']}

    

    plans.Go To Plan Update Form                  ${robson['title']}

    plans.Update Plan Form                        ${souza}

#     Toast Text Should Be                          Plano Atualizado com sucesso      
   
#    [Teardown]                                     resource.Wating Screen Toast Alert and Take Screenshot  2


    Sleep           6