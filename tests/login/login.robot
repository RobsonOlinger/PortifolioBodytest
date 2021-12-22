***Settings***
Documentation       Suite de teste de Login do Administrador
Resource             ${EXECDIR}/resources/resource.robot

# Suite Setup         Tudo aqui acontece antes da  suite
# Suite Teardown      Tudo aqui acontece depois da suite
# Test Setup          Tudo aqui acontece antes do  Teste
# Test Teardown       Tudo aqui acontece depois do Teste

Suite Setup           resource.Start Browser Session
Test Teardown         Take Screenshot




***Test Cases***
    # [tags]  ui
cenario: Login do Administrador
    auth.Go To Login Page
    auth.Login with                 admin@bodytest.com   pwd123     

    nav.User Should Be Logged In    Administrador    

    [Teardown]      resource.Clear LS and Screenshot Test  

 
cenario: Senha incorreta
    auth.Go To Login Page
    auth.Login with                 admin@bodytest.com  pwd124
    
    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Toast Text Should Be      Usuário e/ou senha inválidos.
    
    [Teardown]          resource.Wating Screen Toast Alert and Take Screenshot  2


cenario: E-mail não cadastrado
    auth.Go To Login Page
    auth.Login with                 admin@gmail.com  abc123
    
    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Toast Text Should Be    Usuário e/ou senha inválidos.
    
    [Teardown]          resource.Wating Screen Toast Alert and Take Screenshot  2



cenario: E-mail incorreta
    auth.Go To Login Page
    auth.Login with                 admin&bodytest.com  pwd123
    
    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Alert Text Should Be    Informe um e-mail válido
    
    

cenario: Senha não informada
    auth.Go To Login Page
    auth.Login with                 admin@bodytest.com  ${EMPTY}
  
    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Alert Text Should Be       A senha é obrigatória
    
    



cenario: E-mail não informada
    auth.Go To Login Page
    auth.Login with                ${EMPTY}  pwd123

    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Alert Text Should Be      O e-mail é obrigatório
    
    


cenario: Não informado e-mail e senha
    auth.Go To Login Page
    auth.Login with                 ${EMPTY}  ${EMPTY}
    
    # Wait For Elements State              css=.Toastify__toast-body       visible              5
    # Get Text                             css=.Toastify__toast-body       should be           Usuário ou senha inválido
    
    components.Alert Text Should Be      O e-mail é obrigatório
    components.Alert Text Should Be      A senha é obrigatória  

    

