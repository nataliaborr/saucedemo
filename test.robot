*** Settings ***
Documentation    Suite description
Resource    C:/development/robot-scripts/saucedemo/Resources/keywords.robot
Resource    C:/development/robot-scripts/saucedemo/Resources/begin_end.robot
Library  SeleniumLibrary
Library     String
Test Setup    Begin Web Test
Test Teardown    End Web Test


*** Variables ***
@{URL_AND_BROWSER}  https://www.saucedemo.com/      chrome
@{USERS}  standard_user     locked_out_user     problem_user    performance_glitch_user
${PASSWORD}     secret_sauce
@{PRODUCTS}  id=add-to-cart-sauce-labs-backpack     id=add-to-cart-sauce-labs-bike-light      id=add-to-cart-sauce-labs-bolt-t-shirt      id=add-to-cart-sauce-labs-fleece-jacket     id=add-to-cart-sauce-labs-onesie    id=add-to-cart-test.allthethings()-t-shirt-(red)
@{REMOVE}       id=remove-sauce-labs-backpack     id=remove-sauce-labs-bike-light       id=remove-sauce-labs-bolt-t-shirt      id=remove-sauce-labs-fleece-jacket      id=remove-sauce-labs-onesie    id=remove-test.allthethings()-t-shirt-(red)
@{NAME}  Natalia     Borrillo    82100
${PROD_N_1}    0
${PROD_N_2}    5


*** Test Cases ***
E2E Order Test
    [Tags]    test_standard_user
    Login
    Choose products     ${PRODUCTS}[${PROD_N_1}]    ${PRODUCTS}[${PROD_N_2}]

    click element   id=shopping_cart_container

    Checkout
    Continue    ${NAME}[0]      ${NAME}[1]  ${NAME}[2]

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
    Back to products