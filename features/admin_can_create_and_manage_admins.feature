Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Background:
    Given I am logged in as:
      | name | email           |
      | Tim  | tim@example.com |
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
    When I follow "Mr Admin" within the element for admin "mr.admin@example.com"
    Then I should see "Editing Mr Admin"
    When I fill in "Name" with "Jon"
    And I press "Update Admin"
    Then I should see "Jon" within the element for admin "mr.admin@example.com"

  Scenario: admins can delete admins
    Given the following admins exist:
      | name     | email                |
      | Mr Admin | mr.admin@example.com |
      | Ms Admin | ms.admin@example.com |
    When I am on the admins page
    Then I should see "Mr Admin" within the element for admin "mr.admin@example.com"
    When I follow "Destroy" within the element for admin "mr.admin@example.com"
    Then I should see "Successfully deleted Mr Admin"

  Scenario: admins can not delete themselves
    When I am on the admins page
    Then I should not see "Destroy"
