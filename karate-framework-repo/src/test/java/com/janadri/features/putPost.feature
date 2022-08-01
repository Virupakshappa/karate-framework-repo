Feature: Update user using put call

Background:
* url baseUrl

* def random_string =
"""
function(s){
var text = "";
var pattern = "ABCDEFGHIJKLMNOPQRSTUVabcdefghijklmnopqrstuv";
for(var i=0; i<s; i++)
text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
return text;
}
"""
* def randomString = random_string(9)
* print randomString

* def reqPayload = read('user.json')
* set reqPayload.email = randomString + "@gmail.com"
* print reqPayload



#1st call
Scenario: Update an user with the given data
Given path '/public/v2/users'
And request reqPayload
And header Authorization = 'Bearer ' + tokenID
When method POST
Then status 201
And match $.id == '#present'
And match $.name == 'Veeru'



#fetching the userId from post call
* def usedID = $.id
* print usedID



# 2nd call
* def reqPutPayload =
"""
{
"name": "Itachi"
}
"""


#updating stuffs
Given path '/public/v2/users/' +usedID
And request reqPutPayload
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
* print response
And match $.id == '#present'
And match $.id == usedID
And match $.email == reqPayload.email
