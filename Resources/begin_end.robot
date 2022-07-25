*** Keywords ***
Begin Web Test
    Open Browser    ${URL_AND_BROWSER}[0]   ${URL_AND_BROWSER}[1]
    Maximize Browser Window
    Wait until element is enabled   id=login-button


End Web Test
    click button    id=react-burger-menu-btn
    click element   id=logout_sidebar_link
    Close browser


