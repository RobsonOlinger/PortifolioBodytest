***Settings***
Documentation       Buscar Planos
Resource            ${EXECDIR}/resources/resource.robot


# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Suite Setup         resource.Start Admin Session
Test Teardown       Take Screenshot



***Test Cases***
Cenario: Busca exata
    [tags]       ui
    &{plan}     Create Dictionary       title=Bia Nunes      duration=5     price=15,00    created_at=${EMPTY}      updated_at=${EMPTY} 

    remove_plan

    nav.Go To Plans
    plans.Go To Form Plan
    plans.Fill Plan Form                  ${plan}   
    
    plans.Plans Should be visible         ${plan.title}

    plans.Seach Plan By Title             ${plan.title}

    
    components.Total Items Should Be      1     

  
Cenario: Registro não encontrado
    
    ${name}             Set Variable            Barão Zeno

    remove_plan_by_title                    ${name}
    nav.Go To Plans
    plans.Seach Plan By Title               Barão Zeno   
    components.Register Should Not Be Found



Cenario: Busca plano por um unico termo
   
    #este cenario usa a library da OperatingSystem que esta na resource.robot pra poder usar json
    [tags]          pi
   
    ${fixture}          Get Json            plans-seach.json

    ${plans}         Set Variable        ${fixture['plans']}

    ${word}             Set Variable        ${fixture['word']}
    ${total}            Set Variable        ${fixture['total']}

    remove_plan_by_title        ${word}

    #laço for que anda e ver os nomes na lista students no arquivo json, se @ porque é uma lista
    FOR     ${item}     IN      @{plans}
        insert_plan             ${item}

    END

    
    nav.Go To Plans
    plans.Seach Plan By Title       ${word} 




    FOR     ${item}     IN      @{plans}
        plans.Plans Should be visible                ${item['title']}

    END


    Total Items Should Be                ${total}


    Sleep                       5



    




   

    


