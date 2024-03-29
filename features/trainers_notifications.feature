Feature: Notifications Feeds
  As a Trainer/Assistants
  Be able see notifications

  @javascript
  Scenario: See latest feeds
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    Then I should see "LATEST FEEDS"
    And I should see "Anna Baudelaire send a booking request to you."

  @javascript
  Scenario: View a feed
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    Then I should see "LATEST FEEDS"
    And I view a feed with id "1"
    Then I should see "You Have New Booking Request!"
    And I should see "Anna Baudelaire send a booking request to you. Anna's phone number is 131231381."

  @javascript
  Scenario: See a feed reference
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    Then I should see "LATEST FEEDS"
    And I view a feed with id "1"
    Then I should see "You Have New Booking Request!"
    And I should see "Anna Baudelaire send a booking request to you. Anna's phone number is 131231381."
    And I click "Anna Baudelaire send a booking request to you. Anna's phone number is 131231381." link

  @javascript
  Scenario: Remove a feed reference
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    Then I should see "LATEST FEEDS"
    And I remove a feed with id "1"
    Then I should not see "Anna Baudelaire send a booking request to you."