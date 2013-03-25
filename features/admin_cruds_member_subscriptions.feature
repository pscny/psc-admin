Feature:
  So Members' Subscriptions to Series can be tracked
  As an admin
  I can crud members subscriptions

  Scenario: Admin creates a subscription to a Concert Series
    Given the following member exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
    And I am logged in
    And I am on the members page
    When I follow "Jake Douglas"
    Then I should see "Jake Douglas"
    When I follow "Subscriptions"
    And I follow "New Subscription"
    And I check "Reserved"
    And fill in "Quantity" with "1"
    And fill in "Seat or ticket number" with "C-134"
    And I press "Create Subscription"
    Then I should see "Subscription created"
