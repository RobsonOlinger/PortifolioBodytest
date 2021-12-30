***Settings***
Documentation           Ações de formularios matriculas



***Variables***
${BOTAO_CADASTRAR_MATRICULA}                css=a[href$="/matriculas/new"] 



***Keywords***

Go To Form Matricula
    Set Strict Mode                     false
    Click                               ${BOTAO_CADASTRAR_MATRICULA}
    Wait For Elements State             css=h1 >> text=Nova matrícula     visible     5


Select Student

        [Arguments]                 ${name}
        Fill Text                       css=input[aria-label=student_id]               ${name}
        Sleep                   2
        Click                           css=div[id*=option] >> text= ${name}
        Sleep                   2
        


Select Plan

        [Arguments]                 ${title}
        Fill Text                       css=input[aria-label=plan_id]               ${title}
        Sleep                   2
        Click                           css=div[id*=option] >> text=${title}
        Sleep                   2
        

Start Date Should Today

        ${start_date}             Get Current Date                 result_format=%d/%m/%Y
        Get Attribute             css=input[name=start_date]       value            equal               ${start_date} 

       

End Date Should Today


        [Arguments]                ${end_plan}

        ${end_date}               Get Current Date                 result_format=%d/%m/%Y
        Get Attribute             css=input[name=end_date]         value            equal               ${end_plan}
        Log                       ${end_plan}

        # # Get Page Source = Obter o código-fonte da página 
        # ${code}                         Get Page Source  
        # Log             ${code}                               



        # # Sleep           4


Submit Enrolls Form

    Click                                   css=button[form=formEnrollment]