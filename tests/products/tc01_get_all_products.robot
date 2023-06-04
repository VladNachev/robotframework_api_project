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
Do a GET all products request
    [Documentation]     Running the GET all products request
    ...                 in order to get information about all
    ...                 the product. Validation includes:
    ...                 StatusCode as 200 and some of the
    ...                 returned keys in the body:  id:{},
    ...                 title:'...', price:'...', category:'...',
    ...                 description:'...', image:'...', ...
    ...                 Keywords located in ../../resources/common_get.resource

    Create session to the Web Service
    ${response}=  Do GET request on all products  ${tc_path}
    Check keys in repsonse body  ${tc_path}  ${key_id}  ${key_title}  ${key_price}  ${key_category}  ${key_description}  ${key_image}