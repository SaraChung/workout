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
  
  @javascript
  Scenario: See past workout sessions
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    And I hover "Workouts" link
    And I click "Past Workouts" link
    And I should see "PAST WORKOUT SESSIONS"
    Then I should see following table:
      | Full Name | When | Exercise | Is Private? | Status |

  @coba
  @javascript
  Scenario: View a workout sessions
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    And I click "Workouts" link
    And I view "workout" with id "1"
    Then I should see "Workout Session Details"
    And I should see "Full Name"
    And I should see "Gender"
    And I should see "Phone Number"
    And I should see "Exercise"
    And I should see "From"
    And I should see "To"
    And I should see "Location"
    And I should see "Private?"
    And I should see "Status"