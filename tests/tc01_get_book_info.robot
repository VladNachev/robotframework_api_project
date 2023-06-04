*** Settings ***
Library     RequestsLibrary
Variables   ../resources/variables.py

*** Variables ***
${base_url}     'url=https://demoqa.com/BookStore/v1/Book?ISBN=9781449325862'

*** Test Cases ***
Make GET Request with Parameters
    Create Session    service_session    ${base_url}
    ${response}=    Get On Session    service_session
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}
