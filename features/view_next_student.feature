Feature: view next student in line
  
  As a tutor
  So that I can decide which student to work with
  I want to see who is next in line
  
Scenario: list of students in line
  Given I am logged in as a tutor
  And I am on the student line page
  Then I should see a list of students
 
  
Scenario: working with a student
  Given I am on the student line page
  When I edit student "Salvador"
  Then I should see "Salvador in progress"
  

  
  
Scenario: 
