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
    And I should see a link to the concert series "Beehtoven"

  Scenario: Admin can edit a concert series
    Given the following concert series exists:
      | name |
      | Fox  |
    When I follow "Concert Series"
    Then I should see "Fox"
    When I follow "Fox"
    Then I should see "Editing Fox"
    When I fill in "Name" with "Cat"
    And I press "Update Concert series"
    Then I should see "Cat"
    Then I should see "The Cat Concert Series was successfully updated."
    But I should not see "Fox"

  Scenario: Admin can delete a concert series
    Given the following concert series exists:
      | name  |
      | Fox   |
      | Hound |
    When I follow "Concert Series"
    Then I should see "Hound"
    And I should see "Fox"
    When I follow "Hound"
    And I follow "Destroy"
    Then I should not see "Hound"
    But I should see "Fox"
