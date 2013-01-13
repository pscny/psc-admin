Feature:
  To ensure the data is protected
  Only an authenticated admin can view or go to routes

  Scenario: visitor does not see links to routes
    When I go to the homepage
    Then I should not see "Link1"
