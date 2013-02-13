Feature:
  So admins can log in and administer this system
  As a loged out person
  I can log in as an admin

  Background:
    Given I am logged in
    And I go to the homepage

  Scenario: admins can create concerts
    When I follow "Concerts"
    And I follow "New Concert"
    And I fill in "Name" with ""
    And I fill in "Event Date" with "2012/6/19"
    And I press "Create Concert"
    Then I should see "Morgenstern Trio was successfully created."
