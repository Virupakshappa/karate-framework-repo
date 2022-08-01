Feature: Password Ecrypt

Background:
* def encryptStyle = "AES"
* def passwordString = "Veeru"

Scenario: Passing Password
* def password = Java.type('com.janadri.classFile.Encrypt')
* def JsonRes = new password().method2(encryptStyle, passwordString)
* print JsonRes
