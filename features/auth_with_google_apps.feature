Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Scenario: admins can log in with google
    Given I am logged into gmail as:
      | email | admin@example.org |
      | name  | Mister McLast     |
    And I am on the homepage
    When I follow "Login"
    Then I should be logged in as "Mister McLast"

  @thisone
  Scenario: inactive admins are logged out
    Given the following admins exist:
      | email             | active |
      | admin@example.com | false  |
    And I am logged into gmail as:
      | email | admin@example.com |
    And I am on the homepage
    When I follow "Login"
    Then I should see "Your account is inactive"
    And I should see "Login"

  Scenario: admins can log out
    Given I am logged into gmail as:
      | email | admin@example.org |
      | name  | Mister McLast     |
    And I am on the homepage
    When I follow "Login"
    Then I should be logged in as "Mister McLast"
    When I follow "Logout"
    Then I should see "Login"
