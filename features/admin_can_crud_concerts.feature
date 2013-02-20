Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Background:
    Given I am logged in
    And I go to the homepage

  @thisone
  Scenario: admins can create concerts
    Given the following concert series exists:
      | name      |
      | Hick Hits |
    When I follow "Concerts"
    And I follow "New Concert"
    And I fill in "Name" with "Morgenstern Trio"
    And I fill in "Event Date" with "2012/6/19"
    And I select "Hick Hits" from "Concert series"
    And I press "Create Concert"
    Then I should see "Morgenstern Trio was successfully created."

  Scenario: admins can edit concerts
    Given the following concert exists:
      | name          | date      |
      | Fancy Violins | 2010/6/19 |
    When I follow "Concerts"
    And I follow "Fancy Violins"
    And I fill in "Name" with "Morgenstern Trio"
    And I fill in "Event Date" with "2012/6/19"
    And I press "Update Concert"
    Then I should see "Morgenstern Trio was successfully updated."
    And I should see "Morgenstern Trio"

  Scenario: Admin can delete concerts
    Given the following concert exists:
      | name          | date      |
      | Fancy Violins | 2010/6/19 |
      | Ugly Violins  | 2010/7/19 |
    When I follow "Concerts"
    Then I should see "Fancy Violins"
    And I should see "Ugly Violins"
    When I follow "Fancy Violins"
    And I follow "Destroy"
    Then I should not see "Fancy Violins"
    But I should see "Ugly Violins"
