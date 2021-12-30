***Settings***
Documentation       Cadastro de Planos

Resource            ${EXECDIR}/resources/resource.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Calcular preço total do plano
    
    &{plan}     Create Dictionary       title=Papito Teste      duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Total Plan Should Be        ${plan.total}


Cenario: Cadastro de um novo plano
    [tags]      ui
    &{plan}     Create Dictionary       title=Robson Olinger      duration=06     price=20,00     total=R$ 120,00
    
    remove_plan_by_title      ${plan.title}

    nav.Go To Plans
    plans.Go To Form Plan
    plans.Fill Plan Form  ${plan}

    components.Toast Text Should Be     Plano cadastrado com sucesso

    [Teardown]      resource.Wating Screen Toast Alert and Take Screenshot     2


Cenario: Campos Titulo e duração devem ser obrigatórios
  
    nav.Go To Plans
    plans.Go To Form Plan
    plans.Submit Plan Form

##################################   VALIDAÇÕES         #################################
    components.Alert Text Should Be     Informe o título do plano
    components.Alert Text Should Be     Informe a duração do plano em meses

Ceario: Campo preço deve ser obrigatório
  
    &{plan}     Create Dictionary       title=Papito Teste      duration=12     price=${EMPTY}     

    nav.Go To Plans
    plans.Go To Form Plan
    plans.Fill Plan Form        ${plan}
    plans.Submit Plan Form

##################################   VALIDAÇÕES         #################################
   components.Alert Text Should Be      O preço é obrigatório   
   
   
   
Cenario: Campo preço mensal deve ser maior que zero
    [Tags]      bia
    &{plan}     Create Dictionary       title=Bia      duration=12     price=0,00 

    nav.Go To Plans
    plans.Go To Form Plan
    plans.Fill Plan Form        ${plan}
    plans.Submit Plan Form

##################################   VALIDAÇÕES         #################################
    components.Toast Text Should Be     O valor do plano deve ser maior que zero!

    [Teardown]          resource.Wating Screen Toast Alert and Take Screenshot  2

Cenario: A duração dever ser no máximo 60 meses
    [Tags]      bla
    &{plan}     Create Dictionary       title=Blade      duration=600     price=30,00    

    nav.Go To Plans
    plans.Go To Form Plan
    plans.Fill Plan Form        ${plan}
    plans.Submit Plan Form

##################################   VALIDAÇÕES         #################################
   components.Alert Text Should Be          A duração dever ser no máximo 60 meses


cenario: Validar campos numericos 
    
    [Template]      Check Type Field On Student Form
   
    ${DURATION_FIELD}      number

cenario: Validar campos texto
   
    [Template]      Check Type Field On Student Form
   
    ${TOTAL_FIELD}          text
    ${PRICE_FIELD}          text





***Keywords***
Check Type Field On Student Form
    [Arguments]         ${element}          ${type}
    Set Strict Mode                 false  #faz força para passar e encontrar os seletoes
    nav.Go To Plans
    plans.Go To Form Plan
    components.Field Should Be Type     ${element}      ${type}
