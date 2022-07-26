#Download test.robot file and Resources directory from repository set in
#https://github.com/nataliaborr/saucedemo.git.
#To run the script I lauch this command on PyCharm:
#robot -d Results test.robot
#from the path C:\development\robot-scripts\saucedemo>


*** Settings ***
Documentation    Suite description
Resource    C:/development/robot-scripts/saucedemo/Resources/keywords.robot
Resource    C:/development/robot-scripts/saucedemo/Resources/begin_end.robot
Resource    C:/development/robot-scripts/saucedemo/Resources/locked_out.robot
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
E2E Order with standard user
    [Tags]    test_standard_user
    Login       ${USERS}[0]
    Choose products     ${PRODUCTS}[${PROD_N_1}]    ${PRODUCTS}[${PROD_N_2}]
    Shopping Cart
    Checkout
    Continue    ${NAME}[0]     ${NAME}[1]  ${NAME}[2]
    Imports
    End of the order
    Back to products
    Logout


Login with locked out user
    [Tags]    test_locked_out_user
    Login       ${USERS}[1]
    Error Message