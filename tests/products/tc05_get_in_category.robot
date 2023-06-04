*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/urls.py
Variables   ../../resources/variables.py
Resource    ../../resources/common_get.resource

*** Variables ***
${tc_path}=  ${path_categories_jewelery}
${tc_title_id_5}=  ${title_id_5}
${tc_title_id_6}=  ${title_id_6}
${tc_title_id_7}=  ${title_id_7}

*** Test Cases ***
Do GET in category
    [Tags]  product
    [Documentation]     Running the GET in category request in order
    ...                 to fetch all details in that category. Validation
    ...                 includes: StatusCode as 200 and some of the content.
    ...                 Keywords located in ../../resources/common_get.resource

    Create session to the Web Service
    ${response}=  Do GET request on all products  ${tc_path}
    Check Status as 200  ${response}
    Check content in jewelery  ${tc_path}  ${tc_title_id_5}  ${tc_title_id_6}  ${title_id_7}