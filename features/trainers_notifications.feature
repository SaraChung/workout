Feature: Notifications Feeds
  As a Trainer/Assistants
  Be able see notifications

  @javascript
  Scenario: See latest feeds
    When I visit let's workout web application
    And I go to sign in as a trainer uses "elissa@trainer.com" email
    Then I should see "Latest Feeds"