*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../resources/variables.py

*** Variables ***

*** Test Cases ***
Do a GET Request and validate the response code and response body
    Create Session  mysession  ${base_url_2}  verify=true
    ${response}=  GET On Session  mysession  ${path_book_2}  params=ISBN=9781449325862

    #Check Status as 200
    Status Should Be  200  ${response}

    #Check key-value pairs in the json content
    Log    ${response.json()}
    #Check of "title":"Git Pocket Guide" exist in the json content
    Should Be Equal    ${response.json()}[title]    Git Pocket Guide
    #Check of "author":"Richard E. Silverman" exist in the json content
    Should Be Equal    ${response.json()}[author]    Richard E. Silverman

    #Check numbers of pages
    Should Be Equal As Numbers    ${response.json()}[pages]    234

    #Check if key "description" is present in the repsonse body
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  description
