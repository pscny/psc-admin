Feature:
  So Members' Subscriptions to Series can be tracked
  As an admin
  I can crud members subscriptions

  Scenario: Admin creates a mailing list member
    Given the following member exists:
      | first name | last name | email            |
      | Jake       | Douglas   | jake@example.com |
    And I am logged in
    And I am on the members path
    When I follow "Jake Douglas"
