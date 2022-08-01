Feature: errors

Background:
* def javaFn = Java.type('com.janadri.classFile.JsonToExcelConverter')
* def jsonPath = "C:\\Users\\v.a.janadri\\eclipse-workspace\\Project_1\\data\\errors.json"
* def excelPath = "C:\\Users\\v.a.janadri\\eclipse-workspace\\Project_1\\data\\errors.xlsx"

Scenario: getting the errors
* print 'in errors.feature file : ', caller

* def errorResponse = caller
* print errorResponse

* def errorMessage =
"""
function(arg){

var jsonString = JSON.stringify(arg);
return jsonString;
}
"""
* def errorString = errorMessage(errorResponse)
* print errorString

* def JsonRes = new javaFn().createJson(errorString, jsonPath)
* print JsonRes

* def xlsxRes = new javaFn().createXlsx(jsonPath, excelPath)
* print xlsxRes
