*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Variables   ../../resources/variables.py
Variables   ../../resources/urls.py
Resource    ../../resources/common_post.resource

*** Variables ***
${title}=  ${post_title}
${price}=  ${post_price}
${description}=  ${post_description}
${category}=  ${post_category}

*** Test Cases ***
Do a POST request to add a product
    [Documentation]     Running the "Add new product" request.
    ...                 Validations of returned StatusCode as 200
    ...                 and check if the parameters are mapped correctly.
    ...                 Keywords located in ../../resources/common_post.resource

    ${response}=  Do POST product request  ${title}  ${price}  ${description}  ${category}
    Check status as 200    ${response}
    Validate mapping of parameters    ${response}    ${title}  ${price}  ${description}  ${category}
