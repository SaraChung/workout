Feature: Register for Trainer or Assistant
  As Guest
  Be able to complete registration
	
    
  Scenario: Register as A Trainer
    When I visit let's workout web application
    Then I should see "Are you trainer/assistant?"
    And I click "Are you trainer/assistant?" link
    Then I should see "Trainer/Assistant Sign Up Form"
    And I fill "trainer_first_name" with "Anna"
    And I fill "trainer_last_name" with "Baudelaire"
    And I fill "trainer_email" with "anna.baudelaire@trainer.com"
    And I fill "trainer_password" with "123anna"
    And I fill "trainer_password_confirmation" with "123anna"
    And I choose "0" from "trainer_gender"
    And I fill "trainer_address" with "Kingston Road"
    And I choose "true" from "trainer_trainer"
    Then I click "Sign up" button
    And I should see "One more step"
    

  Scenario: Register as An Assistant
    When I visit let's workout web application
    Then I should see "Are you trainer/assistant?"
    And I click "Are you trainer/assistant?" link
    Then I should see "Trainer/Assistant Sign Up Form"
    And I fill "trainer_first_name" with "Anna"
    And I fill "trainer_last_name" with "Baudelaire"
    And I fill "trainer_email" with "anna.baudelaire@trainer.com"
    And I fill "trainer_password" with "123anna"
    And I fill "trainer_password_confirmation" with "123anna"
    And I choose "0" from "trainer_gender"
    And I fill "trainer_address" with "Kingston Road"
    And I choose "false" from "trainer_trainer"
    Then I click "Sign up" button
    And I should see "One more step"
    And I should see "You are successfully registered on Let's Workout!"