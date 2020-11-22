*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://automationpractice.com/index.php?controller=authentication&back=my-account
${BROWSER}        Chrome
${emailnew}       trol485@yahoo.com
${firstname}      Mara
${lastname}       Popara
${passwordcreate}    kokoska
${address}        3003 Kerbey Ln
${City}           Austin
${postcode}       78702
${mobile}         2025550130
${formElement}    //*[@id="account-creation_form"]
${submitAccount}    //*[@id="submitAccount"]

*** Test Cases ***
Create Account
    Open Browser To Login Page
    Input Username    ${emailnew}
    Submit Credentials
    Populate Create Account Form    ${formElement}    form
    Click Button    ${submitAccount}
    Account Page Should Be Open

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login - My Store

Input Username
    [Arguments]    ${email}
    Input Text    //*[@id="email_create"]    ${emailnew}

Submit Credentials
    Click Button    //*[@id="SubmitCreate"]

Account Page Should Be Open
    Title Should Be    My account - My Store

Populate Create Account Form
    [Arguments]    ${arg1}    ${arg2}
    Wait Until Element Is Enabled    //*[@id="account-creation_form"]/div[1]
    Input Text    //*[@id="customer_firstname"]    ${firstname}
    Input Text    //*[@id="customer_lastname"]    ${lastname}
    Input Text    //*[@id="passwd"]    ${passwordcreate}
    Input Text    //*[@id="address1"]    ${address}
    Input Text    //*[@id="city"]    ${City}
    Select From List By Index    //*[@id="id_state"]    45
    Input Text    //*[@id="postcode"]    ${postcode}
    Select From List By Index    //*[@id="id_country"]    1
    Input Text    //*[@id="phone_mobile"]    ${mobile}
