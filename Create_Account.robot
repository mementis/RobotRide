*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://automationpractice.com/index.php?controller=authentication&back=my-account
${BROWSER}        Chrome
${emailnew}       trol45826@yahoo.com
${firstname}      Mara
${lastname}       Popara
${address}        3003 Kerbey Ln
${City}           Austin
${postcode}       78702
${mobile}         2025550130
${formElement}    //*[@id="account-creation_form"]
${submitAccount}    //*[@id="submitAccount"]
${firstnameElement}    //*[@id="customer_firstname"]
${lastnameElement}    //*[@id="customer_lastname"]
${passwordNew}    kokoska
${passwordElement}    //*[@id="passwd"]
${addressElement}    //*[@id="address1"]
${cityElement}    //*[@id="city"]
${stateElement}    //*[@id="id_state"]
${postcodeElement}    //*[@id="postcode"]
${countryElement}    //*[@id="id_country"]
${mobileElement}    //*[@id="phone_mobile"]
${formBox}        //*[@id="account-creation_form"]/div[1]

*** Test Cases ***
Create Account
    Open Browser To Login Page
    Input Username    ${emailnew}
    Submit Credentials
    Populate Create Account Form    ${formElement}    form
    Submit Account
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
    Wait Until Element Is Enabled    ${formBox}
    Input Text    ${firstnameElement}    ${firstname}
    Input Text    ${lastnameElement}    ${lastname}
    Input Text    ${passwordElement}    ${passwordNew}
    Input Text    ${addressElement}    ${address}
    Input Text    ${cityElement}    ${City}
    Select From List By Index    ${stateElement}    45
    Input Text    ${postcodeElement}    ${postcode}
    Select From List By Index    ${countryElement}    1
    Input Text    ${mobileElement}    ${mobile}

Submit Account
    Click Button    ${submitAccount}
