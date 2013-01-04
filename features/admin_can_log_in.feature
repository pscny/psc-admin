Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Scenario: An Admin logs in
    Given the admin admin@example.com with password sekret exists
    When I go to the admin login page
    And I fill in "email" with "admin@example.com"
    And I fill in "password" with "sekret"
    And I press "Log in"
    Then I should be logged in as an email with email "admin@example.com"
