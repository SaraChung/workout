Feature: Book Trainer/Assistant
  As a User
  Be able to book trainer/assistant

  @javascript
  Scenario: Book A Trainer For The First Time
    When I visit let's workout web application
    Then I should see "First Time Use"
    And I should see "Already Registered?"
    And I click "First Time Use" link
    And I should see "Find Trainer/Assistant"
    Then I select "December" from "book_time_month"
    And I select "30" from "book_time_day"
    And I select "06 AM" from "book_time_hour"
    And I select "15" from "book_time_minute"
    And I select "45" from "book_range"
    And I fill "book_location" with "Toronto"
    And I select "Yoga" from "book_exercise"
    And I choose "true" from "trainer_is_trainer"
    Then I click "Find" button
    And I should see "Elissa"
    And I click trainer card named "Elissa"
    Then I fill "booker_first_name" with "Jessie"
    And I fill "booker_last_name" with "Wood"
    And I fill "booker_email" with "jessie.wood@user.com"
    And I choose "false" from "booker_gender"
    And I fill "booker_phone_number" with "+222444555"
    Then I click "Book" button
    And I should see "Your booking has been sent to Elissa! Elissa will send the confirmation to you."
    And I should see "Please check your dashboard for the confirmation."

  @coba
  @javascript
  Scenario: Book A Trainer For Registered User
    When I visit let's workout web application
    Then I should see "First Time Use"
    And I should see "Already Registered?"
    And I click "Already Registered?" link
    And I should see "Find Trainer/Assistant"
    Then I select "December" from "book_time_month"
    And I select "30" from "book_time_day"
    And I select "06 AM" from "book_time_hour"
    And I select "15" from "book_time_minute"
    And I select "45" from "book_range"
    And I select "Yoga" from "book_exercise"
    And I choose "true" from "trainer_is_trainer"
    And I fill "book_email" with "nna@user.com"
    And I fill "book_phone" with "131231381"
    Then I click "Find" button
    And I should see "Elissa"
    And I click trainer card named "Elissa"
    Then I click "Book" button
    And I should see "Your booking has been sent to Elissa! Elissa will send the confirmation to you."
    And I should see "Please check your dashboard for the confirmation."