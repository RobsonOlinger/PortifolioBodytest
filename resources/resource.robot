***Settings***
Documentation           Tudo começa aqui, arquivo base do projeto de automação
Library                 Browser
Library                 libs/DeloreanLibrary.py
Library                 Collections
Library                 OperatingSystem


Resource                actions/auth.robot
Resource                actions/nav.robot
Resource                actions/students.robot
Resource                actions/components.robot
Resource                actions/plans.robot




***Keywords***
Start Admin Session
    Start Browser Session
    auth.Go To Login Page
    auth.Login with                 admin@bodytest.com   pwd123     
    nav.User Should Be Logged In    Administrador   


Start Browser Session
    New Browser         chromium            False
    New Page            about:blank


Clear LS and Screenshot Test
    Take Screenshot
    LocalStorage Clear      

Wating Screen Toast Alert and Take Screenshot
    [Arguments]             ${timeout}
    Sleep                   ${timeout}
    Take Screenshot



Get Json        
    [Arguments]         ${file_name}

     #ler o arquivo feito json, onde file recebe este arquivo json
    # ${file}=                Get File                ${EXECDIR}/resources/fixtures/students-seach.json
    ${file}=                Get File                ${EXECDIR}/resources/fixtures/${file_name}
    #criando um variavels que recebe Evaluate que faz a conversão e depois o carregamento do arquivo no formato jason
    ${json_object}          Evaluate                json.loads($file)           json
    # Log To Console          ${json_object['students']}

    [return]        ${json_object}