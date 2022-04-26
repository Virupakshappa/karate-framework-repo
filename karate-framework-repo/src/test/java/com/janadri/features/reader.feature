Feature: Reading files

Scenario: Reading json file
* def readJson = read('classpath:com/janadri/data/data.json')
* print readJson
* print readJson[0]
* print readJson[0].ninja
* print readJson[0].ninja[0].name
* print readJson[1].ninja[1].email


Scenario: Reading xml file
* def readXml = read('classpath:com/janadri/data/dataXml.xml')
* print readXml
* print readXml.note.to
* print readXml.note.heading