Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Scenario: admins can log in and log out
    Given the following admin exists:
      | name  | email             | password   |
      | Steve | steve@example.com | hugesekret |
    When I go to the homepage
    And I fill in "Email" with "steve@example.com"
    And I fill in "Password" with "hugesekret"
    And I press "Sign in"
    Then I should be logged in as "Steve"
    And I should see the signout link
    When I follow the signout link
    Then I should see the signin link
    But I should not see the signout link
    And I should be on the login page

  Scenario: admin sees an error when their username or password is wrong
    Given the following admin exists:
      | name  | email            | password    |
      | Steve | good@example.com | giantsekret |
    When I go to the homepage
    And I fill in "Email" with "bad@example.com"
    And I fill in "Password" with "giantsekret"
    And I press "Sign in"
    Then I should see "Invalid email or password."
    And the "Email" field should contain "bad@example.com"
    When I fill in "Email" with "good@example.com"
    And I fill in "Password" with "giantsekret"
    And I press "Sign in"
    Then I should be logged in as "Steve"
