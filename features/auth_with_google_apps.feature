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
    Then I should be logged in as "admin@example.com"
