Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Background:
    Given I am logged in
    And I go to the homepage

  Scenario: admins can create more admins
    When I follow "Admins"
    And I follow "New Admin"
    And I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "sekret"
    And I fill in "Name" with "First Last"
    And I press "Create Admin"
    Then I should see "Editing First Last"

  Scenario: admins can edit admins
    Given the following admin exists:
      | name     | email                |
      | Mr Admin | mr.admin@example.com |
    When I follow "Admins"
    Then I should see "mr.admin@example.com"
    When I follow "Edit" within the element for admin "mr.admin@example.com"
    Then I should see "Edit"
    When I fill in "Name" with "Jon"
    And I press "Update Admin"
    Then I should see "Jon" within the element for admin "mr.admin@example.com"
