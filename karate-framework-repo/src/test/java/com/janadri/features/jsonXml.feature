Feature: Testing files

Background:
* def javaFn = Java.type('com.janadri.JavaFuns')


Scenario: creating xml file
* def result3 = new javaFn().writeData2()
* print result3


Scenario: reading and updating the xml
Reading the xml
* def axml = read('simpledata3.xml')
* print axml

* json ajson = axml
* print ajson

* def bjson = ajson
* set bjson.note.from = 'bengaluru'
* print bjson

* xml cxml = bjson
* print cxml


