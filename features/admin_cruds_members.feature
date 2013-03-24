Feature:
  So members can be created and updated
  As an admin
  I can update and manage members

  Background:
    Given I am logged in
    And I go to the homepage

  Scenario: Admin creates a mailing list member
    When I follow "Members"
    And I follow "New Member"
    And fill in "First name" with "James"
    And fill in "Last name" with "Zevin"
    And fill in "Email" with "james.zevin@example.com"
    And I check "Mailing List"
    And I press "Create Member"
    Then I should see "James Zevin was successfully created."
    And I should see "James Zevin" within the element for member "james.zevin@example.com"
    And I should see "james.zevin@example.com" within the element for member "james.zevin@example.com"

  Scenario: Admin creates a member
    When I follow "Members"
    And I follow "New Member"
    And fill in "First name" with "James"
    And fill in "Last name" with "Zevin"
    And fill in "Email" with "james.zevin@example.com"
    And select "Brochure" from "Source"
    And fill in "Date received" with "2012/6/19"
    And I fill in "Address Line One" with "123 Main St"
    And I fill in "Address Line Two" with "Apt 14A"
    And I fill in "City" with "Brooklyn"
    And select "New York" from "State"
    And I fill in "Zip Code" with "11201"
    And I fill in "Primary phone" with "333-555-4444"
    And I fill in "Secondary phone" with "333-555-2222"
    And I press "Create Member"
    Then I should see "James Zevin was successfully created."
    And I should see "James Zevin" within the element for member "james.zevin@example.com"
    And I should see "james.zevin@example.com" within the element for member "james.zevin@example.com"

  Scenario: Admin edits and existing member
    Given the following member exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
    When I follow "Members"
    And I follow "Jake Douglas"
    Then I should see "Editing Jake Douglas"
    And the "Primary phone" field should contain "\d{3}-\d{3}-\d{4}"
    And the "Secondary phone" field should contain "\d{3}-\d{3}-\d{4}"
    When I fill in "Last name" with "Phillips"
    And I press "Update Member"
    Then I should see "Jake Phillips" within the element for member "jake@example.com"

  Scenario: Admin can delete members
    Given the following member exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
      | Fake       | Douglas   | fake@example.com |
    When I follow "Members"
    Then I should see "Jake Douglas"
    And I should see "Fake Douglas"
    When I follow "Jake Douglas"
    And I follow "Destroy"
    Then I should not see "Jake Douglas"
    But I should see "Fake Douglas"

  Scenario: Admin can search for member by name
    Given the following member exists:
      | first name | last name | email                   |
      | Jake       | Douglas   | jake@example.com        |
      | Paul       | McCartney | beatles_fan@example.com |
    And I follow "Members"
    When I fill in "query" with "Douglas"
    And I press "Search"
    Then I should see "Jake Douglas"
    But I should not see "Paul McCartney"
    And the "query" field should contain "Douglas"
    When I fill in "query" with "Jake"
    And I press "Search"
    Then I should see "Jake Douglas"
    And I should not see "Paul McCartney"
    When I fill in "query" with "beatles"
    And I press "Search"
    Then I should see "Paul McCartney"
    And I should not see "Jake Douglas"
    When I fill in "query" with "nothing"
    And I press "Search"
    Then I should not see "Paul McCartney"
    And I should not see "Jake Douglas"
    But I should see "No Members Found"
