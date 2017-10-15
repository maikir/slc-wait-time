Feature: view next student in line
  
  As a tutor
  So that I can meet the next student
  I want to see who is next in line
  
Scenario: view next student if tutor
  Given I am logged in as a "tutor"
  When I follow "Queue"
  Then I should be on the Queue page
  And I should see the next student
  
Scenario: can't view unless tutor
  Given I am logged in as a "student"
  
  
Scenario: no students in line
  Given I am logged in as a "tutor"
  When I follow
