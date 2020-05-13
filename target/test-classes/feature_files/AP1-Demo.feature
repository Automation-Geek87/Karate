Background:
* url 'https://jsonplaceholder.typicode.com'


@API_First
Scenario: get all users and then get the first user by id

Given path 'users'
When method get
Then status 200

* def first = response[0]
When path 'users', first.id
And method get
Then status 200