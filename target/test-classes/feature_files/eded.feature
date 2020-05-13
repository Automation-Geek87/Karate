Feature: DELETE test script

Feature: Validation

    Scenario:
    * def resp =
"""
{"id": '#string',
"title": "##regex ^[0-9]*$",
"author": '#string',
}

"""

#    * match resp ==
#"""
#[
#  {
#    "id": "1234",
#    "title": "json-server22",
#    "author": "typicode22"
#  }
#  ]
#  
#  """

    * def resp1 =
"""
{"id": "#string",
"title": "9",
"author": '#string',
}
"""

*