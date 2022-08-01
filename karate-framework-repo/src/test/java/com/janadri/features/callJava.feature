Feature: Java Functions

Background:
* def javaFn = Java.type('com.janadri.classFile.JavaFuns')


Scenario: retrieving data through API call and saving the data in an external file    
Given url "https://gorest.co.in/public/v2/users"
And header Authorization = 'Bearer '+tokenID;
When method GET
Then status 200
* print response
* def dummyResponse = response[0]
* print dummyResponse

* xml dummyxml = dummyResponse
* print dummyxml

* def returnedData1 = returnedData
* print returnedData1
* def result3 = new javaFn().writeData3(returnedData1)
* print result3
