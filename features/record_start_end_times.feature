Feature: record start and end times
  
  As a tutor
  So that I can report accurate wait times
  I want to record start and end times
  
Scenario: record times
  Given I am logged in as a tutor
  And I am on the student line page
  When I fill in "start" and "end" times with "0" and "0"
  Then I should see "start" filled with "0" and "end" filled with "0"
