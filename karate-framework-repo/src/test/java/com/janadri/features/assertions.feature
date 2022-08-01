Feature: assertions

Background:
* url baseUrl

@ignore
Scenario: dummy scenario to ignore
* def message = 'Heyyyy'
* print message

Scenario: sample examples for assertions
Given path '/public/v2/users'
When method GET
Then status 200
Then print response
Then match header Content-Type == 'application/json; charset=utf-8'

# !=
* match response[0] != {name: 'Veeru'}

# ==
* match response[0].name == '#present'

# contains
* match response[0] contains {id: '#number'}

# !contains
* match response[0] !contains {id: 0}

# match each
* match each response == {"id":'#number',"name":'#string',"email":'#string',"gender":'#string',"status":'#string'}

# Fuzzy matching
* match response[0] == { id:'#number', name:'#notnull', email:'#ignore', gender:'#string', status:'#present' }

# contains any
* def jsonRead = response[0]
* match response contains any jsonRead

# contains (shortcut)
* match response == '#(^jsonRead)'

# contains deep
* def original = { a: 1, b: 2, c: 3, d: { a: 1, b: 2 } }
* def expected = { a: 1, c: 3, d: { b: 2 } }
* match original contains deep expected

# Schema validation
# should be an array
* match response == '#[]'

