Feature: updating data

Background:
* url baseUrl

* def random_string =
"""
function(s){
var text = "";
var pattern = "ABCDEFGHIJKLMNOPQabcdefghijklmnozxrytw";
for(var i=0; i<s; i++)
text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
return text;
}
"""
* def randomString = random_string(7)
* print randomString

* def reqPayload = read('data.json')
* set reqPayload.email = randomString + "@gmail.com"
* print reqPayload


Scenario: Adding the data using POST call
Given path '/public/v2/users'
And header Authorization = 'Bearer ' + tokenID
And request reqPayload
When method POST
Then status 201
And match $.id == '#present'
And match $.name == 'Itachi'

* def userID = $.id
* print userID

* def updatePayload =
"""
{
"name": "Copy Ninja"
}
"""

# updating the data using PUT call
Given path 'public/v2/users/' +userID
And request updatePayload
And header Authorization = 'Bearer ' + tokenID
When method PUT
Then status 200
* print response
And match $.id == userID











