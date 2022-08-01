Feature: get details

Background:

* configure afterScenario =
"""
function() {
var info = karate.info;

if(info.errorMessage){
karate.call('ServiceNowTicket.feature@CreateIncid', { caller : info });
}
}
"""


@CreateErrorMsg
Scenario: matching two Strings
* def Text1 = 'Hey'
* def Text2 = 'Hello'
* match Text1 == Text2


@CreateIncid @ignore
# creating incident with POST call
Scenario: pushing error data to ServiceNow
Given url 'https://dev112050.service-now.com/'
And header Authorization = call read('basic-auth.js') { username: 'admin', password: 'Ge3=uNqqI!9X' }

And path 'api/now/table/incident'
And request caller
When method POST
Then status 201
Then print response
* def resInc = response.result.number
* def resSysId = response.result.sys_id
* print resInc
* print resSysId


# converting JSON object into String
* def errorMessage =
"""
function(arg){

var jsonString = JSON.stringify(arg);
return jsonString;
}
"""

* def errorString = errorMessage(caller)
* print errorString


# setting error message to description 
* set response.description = errorString
* set response.short_description = "String mismatch"
* set response.caller_id = "Veeru Janadri"


# updating the incident with description
And path 'api/now/table/incident/' + resSysId
And params {"sysparm_fields":"number,sys_id,category,opened_at,sys_created_by,description,caller_id,short_description"}
And request response
When method PUT
Then status 200
Then print response

# printing the incident name and sys_id
* print 'Incident has been created...' + resInc + ' sys_id is ' +  resSysId


