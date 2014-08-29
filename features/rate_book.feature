Feature: Accessing books
  As a user, I want to rate a book

  @javascript
  Scenario: Rate book with a given user
    Given TestUser is logged in
    And A book exists in the system
    And TestUser visits the book index page
    When User gives a rating of 5 stars
    Then Book has a user rating of 5 stars

