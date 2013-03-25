Feature:
  So Members' Subscriptions to Series can be tracked
  As an admin
  I can crud members subscriptions

  Scenario: Admin creates a subscription to a Concert Series
    Given the following member exists:
      | first name | last name |
      | Jake       | Douglas   |
    Given the following concert series exists:
      | name |
      | Bach |
    And I am logged in
    And I am on the members page
    When I follow "Jake Douglas"
    Then I should see "Jake Douglas"
    When I follow "Subscriptions"
    And I follow "New Subscription"
    And select "Bach" from "Concert series"
    And I check "Reserved"
    And fill in "Quantity" with "1"
    And fill in "Seat or ticket number" with "C-134"
    And I press "Create Subscription"
    Then I should see "Jake Douglas is subscribed to Bach"
    And I should see "Bach" within the element for subscription "Bach"
    And I should see "1" within the element for subscription "Bach"
    And I should see "C-134" within the element for subscription "Bach"
