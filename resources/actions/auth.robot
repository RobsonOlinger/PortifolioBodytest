***Settings***
Documentation           Ações de autorização


***Keywords***
Go To Login Page
    Go To            https://bodytest-web-olinger.herokuapp.com/


Login with
    [Arguments]         ${email}    ${senha}
    
    Fill Text           css=input[name=email]               ${email}
    Fill Text           css=input[placeholder*=senha]       ${senha}
    Click               text=Entrar



