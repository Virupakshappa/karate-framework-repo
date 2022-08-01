Scenario Outline: name is <name> and age is <age>
  * def temp = '<name>'
  * match temp == name
  * match temp == __row.name
  * def expected = __num == 0 ? 'name is Bob and age is 5' : 'name is Nyan and age is 6'
  * match expected == karate.scenario.name

  Examples:
    | name | age |
    | Bob  | 5   |
    | Nyan | 6   |

Scenario Outline: magic variables with type hints
  * def expected = [{ name: 'Bob', age: 5 }, { name: 'Nyan', age: 6 }]
  * match __row == expected[__num]

  Examples:
    | name | age! |
    | Bob  | 5    |
    | Nyan | 6    |

Scenario Outline: embedded expressions and type hints
  * match __row == { name: '#(name)', alive: '#boolean' }

  Examples:
    | name | alive! |
    | Bob  | false  |
    | Nyan | true   |

Scenario Outline: inline json
  * match __row == { first: 'hello', second: { a: 1 } }
  * match first == 'hello'
  * match second == { a: 1 }

  Examples:
    | first  | second!  |
    | hello  | { a: 1 } |
