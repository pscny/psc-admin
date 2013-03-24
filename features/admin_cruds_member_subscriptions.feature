Feature:
  So Members' Subscriptions to Series can be tracked
  As an admin
  I can crud members subscriptions

  Background:
    Given I am logged in
    And I go to the homepage
    When I follow "Members"

  Scenario: Admin creates a mailing list member
    And I follow "New Member"
    And fill in "First name" with "James"
    And fill in "Last name" with "Zevin"
    And fill in "Email" with "james.zevin@example.com"
    And I check "Mailing list"
    And I press "Create Member"
    Then I should see "James Zevin was successfully created."
    And I should see "James Zevin" within the element for member "james.zevin@example.com"
    And I should see "james.zevin@example.com" within the element for member "james.zevin@example.com"

