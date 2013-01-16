Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Scenario: admins can log in and log out
    Given the following admin exists:
      | name  | email             | password     |
      | Steve | steve@example.com | hugesekret   |
    When I go to the homepage
    And I follow "Login"
    And I fill in "Email" with "steve@example.com"
    And I fill in "Password" with "hugesekret"
    And I press "Sign in"
    Then I should be logged in as "Steve"
    And I should see "Logout"
    When I follow "Logout"
    Then I should see "Login"
    But I should not see "Logout"
    And I should be on the login page

  Scenario: admin sees an error when their username or password is wrong
    Given the following admin exists:
      | name  | email            | password      |
      | Steve | good@example.com | giantsekret   |
    When I go to the homepage
    And I follow "Login"
    And I fill in "Email" with "bad@example.com"
    And I fill in "Password" with "giantsekret"
    And I press "Sign in"
    Then I should see "Invalid email or password."
    And the "Email" field should contain "bad@example.com"
    When I fill in "Email" with "good@example.com"
    And I fill in "Password" with "giantsekret"
    And I press "Sign in"
    Then I should be logged in as "Steve"
