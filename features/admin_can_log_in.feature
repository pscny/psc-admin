Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Scenario: admins can log in and log out
    Given the admin admin@example.com with password sekret exists
    When I go to the homepage
    And I follow "Login"
    And I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "sekret"
    And I press "Sign In"
    Then I should be logged in as "admin@example.com"
    And I should see "Logout"
    When I follow "Logout"
    Then I should see "Login"
    But I should not see "Logout"
