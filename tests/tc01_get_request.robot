*** Settings ***
Library     RequestsLibrary

*** Variables ***
${base_url}     https://demoqa.com/BookStore/v1/
${book_isbn}    Book?ISBN=9781449325862

*** Test Cases ***
Get_book_info
    create session  service_session     ${base_url}
    ${response}=     get request     service_session     ${book_isbn}
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}
