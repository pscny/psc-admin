Feature:
  So subscribers can be created and updated
  As an admin
  I can update and manage subscribers

  Background:
    Given I am logged in
    And I go to the homepage

  @thisone
  Scenario: Admin creates a subscriber
    When I follow "Subscribers"
    And I follow "New Subscriber"
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
    And I press "Create Subscriber"
    Then I should see "James Zevin was successfully created."
    And I should see "James Zevin" within the element for subscriber "james.zevin@example.com"
    And I should see "james.zevin@example.com" within the element for subscriber "james.zevin@example.com"

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
    When I follow "Jake Douglas"
    And I follow "Destroy"
    Then I should not see "Jake Douglas"
    But I should see "Fake Douglas"
