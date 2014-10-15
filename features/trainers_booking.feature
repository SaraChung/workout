Feature: Book Trainer/Assistant
  As a User
  Be able to book trainer/assistant

  @javascript
  Scenario: Book A Trainer For The First Time
    When I visit let's workout web application
    Then I should see "First Time Use"
    And I should see "Already Registered?"
    And I click "First Time Use" link
    And I should see "Book Trainer/Assistant"
    Then I fill "user_book_date" with "10/10/2019"
    And I fill "user_book_start" with "10.00 AM"
    And I fill "user_book_end" with "11.30 AM"
    And I choose "Yoga" from "user_workout_list"
    And I choose "Trainer" from "user_trainer"
    Then I click "Find" button
    And I should see "Elissa"
    And I click "Elissa" link
    Then I fill "user_first_name" with "Jessie"
    And I fill "user_last_name" with "Wood"
    And I fill "user_email" with "jessie.wood@user.com" on "new_user" form
    And I choose "false" from "user_gender"
    And I fill "user_phone_number" with "+222444555"
    Then I click "Book" button
    And I should see "Your book has been sent to Elissa! Elissa will send the confirmation."
    And I should see "Please check your dashboard for the confirmation."