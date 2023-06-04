*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/urls.py
Variables   ../../resources/variables.py
Resource    ../../resources/common_get.resource

*** Variables ***
${tc_path}=  ${path_products}

*** Test Cases ***
Get and limit the results
    [Tags]  products
    [Documentation]     Running the GET product request with limit parameter
    ...                 Keywords located in ../../resources/common_get.resource

    Create session to the Web Service
    ${response}=  Get request and limit the results  ${tc_path}  ${param_limit}
    Check status as 200  ${response}
    Check if "id": 4 exist and if "id": 5 doesn't    ${tc_path}    ${param_limit}