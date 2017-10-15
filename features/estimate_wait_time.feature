Feature: estimated wait time for help
  
  As a busy student
  So that I can decide whether to wait in line or not
  I want to know my estimated wait time
  
Scenario: students signs in for “drop-in”
  When a student is on the home page 
  When the student clicks sign in
  Then I should see a wait time

  
#student email confirmation should have abiltiy to cancel I think

