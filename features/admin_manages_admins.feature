Feature:
  So admins can change their name or ban other admins
  As an admin
  I can change names and ban other admins

  Background:
    Given I am logged in as:
      | name  |
      | Steve |

  Scenario: Admin changes their name
    When I am on the admins page
    And I follow "Steve"
    And fill in "Name" with "James"
    And I press "Update Admin"
    Then I should see "James"
    And I should not see "Steve"
    And I should see "updated"

  Scenario: Admin changes another admins' name
    Given the following admins exist:
      | name |
      | Todd |
    And I am on the admins page
    When I follow "Todd"
    And fill in "Name" with "James"
    And I press "Update Admin"
    Then I should see "James"
    And I should not see "Todd"
    And I should see "updated"

  Scenario: Admin deactivates another admin
    Given the following admins exist:
      | name | email            |
      | Todd | todd@example.com |
    When I am on the admins page
    Then I should see "Active" within the element for admin "todd@example.com"
    And I should not see "Inactive" within the element for admin "todd@example.com"
    When I follow "Deactivate" within the element for admin "todd@example.com"
    Then I should see "Todd has been deactivated"
    And I should see "Inactive" within the element for admin "todd@example.com"

  Scenario: Admin activates another admin
    Given the following admins exist:
      | name | email            | active |
      | Todd | todd@example.com | false  |
    When I am on the admins page
    Then I should see "Inactive" within the element for admin "todd@example.com"
    When I follow "Reactivate" within the element for admin "todd@example.com"
    Then I should see "Successfully updated Todd"
    And I should see "Active" within the element for admin "todd@example.com"
