Feature: Register for Trainer or Assistant
  As Guest
  Be able to complete registration

  @javascript
  Scenario: Register as A Trainer
    When I visit let's workout web application
    Then I should see "TRAINER/ASSISTANT?"
    And I click "Trainer/Assistant?" link
    Then I should see "Trainer/Assistant Sign Up Form"
    And I fill "trainer_first_name" with "Anna"
    And I fill "trainer_last_name" with "Baudelaire"
    And I fill "trainer_email" with "anna.baudelaire@trainer.com" on "new_trainer" form
    And I fill "trainer_password" with "1234anna" on "new_trainer" form
    And I fill "trainer_password_confirmation" with "1234anna"
    And I choose "false" from "trainer_gender"
    And I fill "trainer_address" with "Kingston Road"
    And I fill "trainer_phone_number" with "+11232321"
    And I choose "true" from "trainer_is_trainer"
    Then I click "Sign up" button
    And I should see "You are successfully registered on Let's Workout!"
    And I should see "Choose your skills"
    

  Scenario: Register as An Assistant
    When I visit let's workout web application
    Then I should see "Trainer/Assistant?"
    And I click "Trainer/Assistant?" link
    Then I should see "Trainer/Assistant Sign Up Form"
    And I fill "trainer_first_name" with "Anna"
    And I fill "trainer_last_name" with "Baudelaire"
    And I fill "trainer_email" with "anna.baudelaire@trainer.com" on "new_trainer" form
    And I fill "trainer_password" with "1234anna" on "new_trainer" form
    And I fill "trainer_password_confirmation" with "1234anna"
    And I choose "false" from "trainer_gender"
    And I fill "trainer_address" with "Kingston Road"
    And I fill "trainer_phone_number" with "+11232321"
    And I choose "false" from "trainer_is_trainer"
    Then I click "Sign up" button
    And I should see "You are successfully registered on Let's Workout!"
    And I should see "Choose your skills"
