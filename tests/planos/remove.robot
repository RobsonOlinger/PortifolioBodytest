***Settings***
Documentation       Suite de Remover Cadastro de planos
Resource            ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste



Test Setup         resource.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Remover plano cadastrado
        [Tags]      re
        
        &{plan}     Create Dictionary       title=Brenda Capry      duration=12     price=50,00   

       
        # insert_plan                            ${plan}

        nav.Go To Plans
        plans.Go To Form Plan
        plans.Fill Plan Form                    ${plan}
        


        plans.Seach Plan By Title               ${plan.title}
        
        plans.Request Removal By Title          ${plan.title}
        plans.Confirm Removal
        
        components.Toast Text Should Be         Plano removido com sucesso
        plans.Plans Should be not visible       ${plan.title}

        [Teardown]      resource.Wating Screen Toast Alert and Take Screenshot  2


Cenario: Desistir da exclusão

        &{plan}     Create Dictionary       title=Spider Man      duration=10     price=10,00 

        nav.Go To Plans
        plans.Go To Form Plan
        plans.Fill Plan Form                    ${plan}
        


        plans.Seach Plan By Title               ${plan.title}
        
        plans.Request Removal By Title          ${plan.title}
                
        plans.Cancel Removal

        [Teardown]      resource.Wating Screen Toast Alert and Take Screenshot  2





    
