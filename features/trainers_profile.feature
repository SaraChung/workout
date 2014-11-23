Feature: Trainer's Profile
  As a Trainer/Assistants
  Be able see and modify his/her own profile

  @javascript
  Scenario: See my own profile
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    And I click "Workouts" link
    And I should see "Full Name"
    And I should see "Gender"
    And I should see "Birthdate"
    And I should see "Skills"
    And I should see "Workout Quotes"
    And I should see "Interests"
    And I should see "About"