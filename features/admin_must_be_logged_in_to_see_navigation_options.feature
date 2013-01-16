Feature:
  To ensure the data is protected
  Only an authenticated admin can view or go to routes

  Scenario: visitor can not see admin navigation
    When I go to the homepage
    Then I should not see a link with the text "Admins"
    When I am logged in
    And I go to the homepage
    Then I should see a link with the text "Admins"

  Scenario: visitor can not go to protected routes
    When I go to the admins page
    Then I should see "You need to sign in or sign up before continuing."
    And I should be on the login page
    When I am logged in
    And I am on the admins page
    Then I should be on the admins page
