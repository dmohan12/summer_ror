Feature: View Todos
    Scenario: Visiting homepage when signed in
        Given there two users with todos, Panks and Tom
        And I sign in as Panks
        When I visit the homepage
        Then I should only see Panks's Post