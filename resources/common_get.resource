*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../resources/urls.py

*** Keywords ***
Create session to the Web Service
    Create Session  fakeshop_session  ${base_url}  verify=true

Do Get reqeust on a product ID
    [Arguments]  ${path_products_id}
    GET On Session  fakeshop_session  ${path_products_id}

Do GET request on all products
    [Arguments]  ${tc_path}
    GET On Session  fakeshop_session  ${tc_path}

Check status as 200
    [Arguments]  ${response}
    Status Should Be  200  ${response}

Check keys in repsonse body
    [Arguments]  ${tc_path}  ${key_id}  ${key_title}  ${key_price}  ${key_category}  ${key_description}  ${key_image}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  ${key_id}
    Should Contain  ${body}  ${key_title}
    Should Contain  ${body}  ${key_price}
    Should Contain  ${body}  ${key_category}
    Should Contain  ${body}  ${key_description}
    Should Contain  ${body}  ${key_image}

Check keys' parameters in response body
    [Arguments]  ${tc_path}  ${param_title}  ${param_category}  ${param_price}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[title]    ${param_title}
    Should Be Equal    ${response.json()}[category]    ${param_category}
    Should Be Equal    ${response.json()}[price]    ${param_price}

Get request and limit the results
    [Arguments]  ${tc_path}  ${param_limit}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}  ${param_limit}

Check if "id": 4 exist and if "id": 5 doesn't
    [Arguments]  ${tc_path}  ${param_limit}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}  ${param_limit}
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  "id":4
    Should not Contain  ${body}  "id":5

Check categories in response body
    [Arguments]  ${tc_path}  ${tc_categ_1}  ${tc_categ_2}  ${tc_categ_3}  ${tc_categ_4}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  ${tc_categ_1}
    Should Contain  ${body}  ${tc_categ_2}
    Should Contain  ${body}  ${tc_categ_3}
    Should Contain  ${body}  ${tc_categ_4}

Check content in jewelery
    [Arguments]  ${tc_path}  ${tc_title_id_5}  ${tc_title_id_6}  ${tc_title_id_7}
    ${response}=  GET On Session  fakeshop_session  ${tc_path}
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  ${tc_title_id_5}
    Should Contain  ${body}  ${tc_title_id_6}
    Should Contain  ${body}  ${tc_title_id_7}



