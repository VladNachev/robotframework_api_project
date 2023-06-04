*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../resources/urls.py

*** Keywords ***
Do POST product request
    [Arguments]  ${title}  ${price}  ${description}  ${category}
    ${body}    Create Dictionary    title=${title}    price=${price}    description=${description}    category=${category}
    ${response}    POST    url=${base_url_products}      json=${body}
    Log    ${response.json()}
    [Return]  ${response}

Check status as 200
    [Arguments]  ${response}
    Status Should Be  200  ${response}

Validate mapping of parameters
    [Arguments]  ${response}  ${title}  ${price}  ${description}  ${category}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[title]    ${title}
    Should Be Equal    ${response.json()}[price]    ${price}
    Should Be Equal    ${response.json()}[description]    ${description}
    Should Be Equal    ${response.json()}[category]    ${category}