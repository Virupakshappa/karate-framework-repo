Scenario Outline: name is ${name.first} ${name.last} and age is ${age}
  * match name.first == "#? _ == 'Bob' || _ == 'Nyan'"
  * match name.last == "#? _ == 'Dylan' || _ == 'Cat'"
  * match title == karate.scenario.name

Examples:
  | name!                               | age | title                           |
  | { "first": "Bob", "last": "Dylan" } | 10  | name is Bob Dylan and age is 10 |
  | { "first": "Nyan", "last": "Cat" }  | 5   | name is Nyan Cat and age is 5   |
