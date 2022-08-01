#@ignore @report=false
Feature: check env

@envnot=dev,qa
#@parallel=false
Scenario: runs when karate.env is not 'dev' or'qa'
* print 'heyyy'
* print 'karate.env assigned in karate-config.js is:', env
