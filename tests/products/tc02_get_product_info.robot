*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/urls.py
Variables   ../../resources/variables.py
Resource    ../../resources/common_get.resource

*** Variables ***
${tc_path}=  ${path_products_id}

*** Test Cases ***
Do Get reqeust on a product
    [Documentation]     Running the GET a single product request
    ...                 in order to get info about the product.
    ...                 Validations: StatusCode as 200 and some
    ...                 of the expected keys' parameters in the
    ...                 reponse body.Keywords located in
    ...                 ../../resources/common_get.resource

    Create session to the Web Service
    ${response}=  Do Get reqeust on a product ID  ${tc_path}
    Check Status as 200  ${response}
    Check keys' parameters in response body  ${tc_path}  ${param_title}  ${param_category}  ${param_price}
