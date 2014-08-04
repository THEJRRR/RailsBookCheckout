Feature: Adding books
  As a user, I want to add books.

Scenario: I am logged in as TestUser, and add a book
    Given TestUser is logged in
    And TestUser adds a book on the add book page
    Then The book is added to the libarary database, but is not approved

Scenario: I am not logged in, and add a book
    Given No one is logged in
    And User visits the add book page
    Then The User is redirected to the sign in page

Scenario: I am an admin and I want to approve a book
    Given TestAdmin is logged in
    And There is a book that has beed added, but approved
    When TestAdmin visits the approve books page
    And TestAdmin approves the book
    Then The book is now approved
