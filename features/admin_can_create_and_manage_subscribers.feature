Feature:
  So subscribers can be created and updated
  As an admin
  I can update and manage subscribers

  Background:
    Given I am logged in
    And I go to the homepage

  Scenario: Admin creates a subscriber
    When I follow "Subscribers"
    And I follow "New Subscriber"
    And fill in "First name" with "James"
    And fill in "Last name" with "Zevin"
    And fill in "Email" with "james.zevin@example.com"
    And select "Brochure" from "Source"
    And fill in "Date received" with "2012/6/19"
    And I press "Create Subscriber"
    Then I should see "James Zevin was successfully created."

  Scenario: Admin edits and existing subscriber
    Given the following subscriber exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
    When I follow "Subscribers"
    And I follow "Jake Douglas"
    Then I should see "Editing Jake Douglas"
    When I fill in "Last name" with "Phillips"
    And I press "Update Subscriber"
    Then I should see "Jake Phillips" within the element for subscriber "jake@example.com"

  Scenario: Admin can delete subscribers
    Given the following subscriber exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
      | Fake       | Douglas   | fake@example.com |
    When I follow "Subscribers"
    Then I should see "Jake Douglas"
    And I should see "Fake Douglas"
    When I follow "Destroy" within the element for subscriber "jake@example.com"
    Then I should not see "Jake Douglas"
    But I should see "Fake Douglas"
