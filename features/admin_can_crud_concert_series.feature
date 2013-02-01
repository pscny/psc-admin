Feature:
  So concert series can be created and updated
  As an admin
  I can update and manage concert series

  Background:
    Given I am logged in
    And I go to the homepage

  Scenario: Admin creates a concert series
    When I follow "Concert Series"
    And I follow "New Concert series"
    And I fill in "Name" with "Beehtoven"
    And I press "Create Concert series"
    Then I should see "The Beehtoven Concert Series was successfully created."

  @thisone
  Scenario: Admin can edit a concert series
    Given the following concert series exists:
      | name |
      | Fux  |
    When I follow "Concert Series"
    And I follow "Fux"
    Then I should see "Editing Fux"
