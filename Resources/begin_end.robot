*** Keywords ***
Begin Web Test
    Open Browser    ${URL_AND_BROWSER}[0]   ${URL_AND_BROWSER}[1]
    Maximize Browser Window
    Wait until element is enabled   id=login-button


End Web Test
    Close browser


