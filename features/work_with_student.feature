Feature: work with new student
  
  As a tutor
  So that I don't get fired
  I want to work with a new student
  

Scenario: working with a student
  Given I am on the student line page
  When I edit student "Salvador"
  Then I should see "Salvador in progress"