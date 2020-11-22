*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://automationpractice.com/index.php?controller=authentication&back=my-account
${BROWSER}        Chrome
${email}          mena_tra@yahoo.com
${password}       kokoska

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${email}
    Input Password    ${password}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login - My Store

Input Username
    [Arguments]    ${email}
    Input Text    //*[@id="email"]    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="passwd"]    ${password}

Submit Credentials
    Click Button    //*[@id="SubmitLogin"]

Welcome Page Should Be Open
    Title Should Be    My account - My Store
