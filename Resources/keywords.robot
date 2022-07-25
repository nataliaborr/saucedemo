*** Keywords ***
Login
    Input Text  id=user-name    ${USER}[0]
    Input Text  id=password    ${USER}[1]
    click button    id=login-button

Choose Product
    [Arguments]     ${product}      ${removed}
    click button    ${product}
    Wait Until Element Is Enabled   ${removed}

Continue
    [Arguments]     ${name}     ${lastname}     ${postalcode}
    Wait Until Element Is Enabled   id=continue
    Input Text  id=first-name    ${name}
    Input Text  id=last-name    ${lastname}
    Input Text  id=postal-code    ${postalcode}
    Click Button    id=continue

End of the order
    Click Button    id=finish
    page should contain    THANK YOU FOR YOUR ORDER

Back to products
    page should contain button      id=back-to-products
    Click Button  id=back-to-products

