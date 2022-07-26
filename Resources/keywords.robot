*** Keywords ***
Login
    [Arguments]     ${user}
    Input Text  id=user-name    ${user}
    Input Text  id=password    ${PASSWORD}
    Sleep  2s
    click button    id=login-button

Choose Product
    [Arguments]     ${product}      ${removed}
    click button    ${product}
    Wait Until Element Is Enabled   ${removed}
    Sleep  2s

Choose products
    [Arguments]     ${prod1}    ${prod2}
    Choose Product      ${prod1}      ${REMOVE}[${PROD_N_1}]
    Choose Product      ${prod2}      ${REMOVE}[${PROD_N_2}]

Continue
    [Arguments]     ${name}     ${lastname}     ${postalcode}
    Wait Until Element Is Enabled   id=continue
    Input Text  id=first-name    ${name}
    Input Text  id=last-name    ${lastname}
    Input Text  id=postal-code    ${postalcode}
    Scroll element into view    id=continue
    Sleep  2s
    Click Button    id=continue

Shopping Cart
    Scroll element into view    id=shopping_cart_container
    ${numberofitemsstr}  Get Text  xpath=//*[@id="shopping_cart_container"]/a/span
    Should be equal     ${numberofitemsstr}     2
    click element   id=shopping_cart_container

Checkout
    Wait Until Element Is Enabled   id=checkout
    Sleep  2s
    Scroll element into view  id=checkout
    Click Button    id=checkout

Imports
    ${firstitemstring}    Get Text  xpath=//*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]/div
    ${firstitem}    fetch from right  ${firstitemstring}  $
	${first}	Convert To Number	${firstitem}
    ${seconditemstring}    Get Text  //*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[2]/div[2]/div
    ${seconditem}    fetch from right  ${seconditemstring}  $
	${second}	Convert To Number	${seconditem}
	${total}    Evaluate  ${first} + ${second}
    ${itemtotalstring}    Get Text  xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[5]
    ${itemtotal}    fetch from right  ${itemtotalstring}  $
	${order}	Convert To Number  ${itemtotal}
	Should be equal		${order}	  ${total}

End of the order
    Click Button    id=finish
    page should contain    THANK YOU FOR YOUR ORDER

Back to products
    page should contain button      id=back-to-products
    Click Button  id=back-to-products

Logout
    click button    id=react-burger-menu-btn
    Sleep  2s
    click element   id=logout_sidebar_link