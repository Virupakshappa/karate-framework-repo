Feature: xml create and read

Background:
* def javaFn = Java.type('com.janadri.classFile.JavaFuns')

@ignore
Scenario: creating xml file
* def result3 = new javaFn().writeData2()
* print result3


Scenario: updating xml file
* def readXml = read('data/simpledata3.xml')
* print readXml
#* def result3 = new javaFn().writeData3('<?xml version="1.0"?><note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Dont forget me this weekend!</body></note>')
* print result3


Scenario: reading xml file
* def readXml = read('data/simpledata3.xml')
* print result3
