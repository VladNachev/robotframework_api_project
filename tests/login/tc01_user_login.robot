*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/variables.py
Variables   ../../resources/urls.py
Resource    ../../resources/common_post.resource

*** Variables ***
${tc_username}=  ${username}
${tc_password}=  ${password}

*** Test Cases ***
Do a POST user login to get token
    [Tags]  login
    [Documentation]     Run the "auth/login" request to fetch to token.
    ...                 Keywords located in ../../resources/common_post.resource

    ${response}=  Do a POST user login    ${tc_username}    ${tc_password}
    Check status as 200    ${response}
    Check for token     ${response}