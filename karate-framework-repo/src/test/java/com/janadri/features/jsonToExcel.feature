Feature: To test Excel Update Feature

Background:
* def javaFn = Java.type('com.janadri.classFile.JsonfileToExcelfile')
* def jsonFilePath = "C:/Users/v.a.janadri/eclipse-workspace/Project_1/data/payload1.json"
* def ExcelEstension = ".xlsx"
* def excelFilePath = "C:/Users/v.a.janadri/eclipse-workspace/Project_1/data/excel.xlsx"


@smoke @regression
Scenario: getting the errors

* def response = new javaFn().jsonFileToExcelFile(jsonFilePath,excelFilePath,ExcelEstension)
* print response
