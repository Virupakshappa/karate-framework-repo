Feature: read json

Scenario: reading json file
* print myVarName
* print paths

* def javaUtil = Java.type('com.janadri.classFile.UiPath');
* def res = javaUtil.trigger(paths.assertionJsonInput)
