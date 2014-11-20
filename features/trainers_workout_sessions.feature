Feature: Workout Sessions
  As a Trainer/Assistants
  Be able see his/her own workout sessions

  @javascript
  Scenario: See workout statistics
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    And I click "Workouts" link
    And I should see "YOUR WORKOUT SESSIONS"
    And I should see "Workout sessions request to you"
    And I should see "Accepted upcoming workout sessions"
    And I should see "Past workout sessions"
    And I should see "Accepted past workout sessions"
    And I should see "Declined past workout sessions"
    And I should see "LATEST 10 REQUESTS"
    And I should see "10 UPCOMING WORKOUTS"