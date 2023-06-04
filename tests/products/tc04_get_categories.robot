*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/urls.py
Variables   ../../resources/variables.py
Resource    ../../resources/common_get.resource

*** Variables ***
${tc_path}=  ${path_categories}
${tc_categ_1}=  ${category_1}
${tc_categ_2}=  ${category_2}
${tc_categ_3}=  ${category_3}
${tc_categ_4}=  ${category_4}

*** Test Cases ***
Do a GET all categories
    [Tags]  products
    [Documentation]     Running the GET all categories request in order
    ...                 to fetch all the categories. Validation includes:
    ...                 StatusCode as 200 and some of the categories.
    ...                 Keywords located in ../../resources/common_get.resource

    Create session to the Web Service
    ${response}=  Do GET request on all products  ${tc_path}
    Check Status as 200  ${response}
    Check categories in response body  ${tc_path}  ${tc_categ_1}  ${tc_categ_2}  ${tc_categ_3}  ${tc_categ_4}