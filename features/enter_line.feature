Feature: enter line for help
  
  As a student
  So that I can receive help with my writing
  I want to get in line

Scenario: display sign up page
  Given I am on the wait time page
  And I click "yes"
  Then I should be on the sign up form

Scenario: do not wait in line
  Given I am on the wait time page
  And I click "no"
  Then I should not be on the sign up form

Scenario: submit sign up form
  Given I am on the sign up form
  And I fill out information
  And I click "submit"
  Then I should be on the success page
