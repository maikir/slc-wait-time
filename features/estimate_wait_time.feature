Feature: estimated wait time for help
  
  As a busy student
  So that I can decide whether to wait in line or not
  I want to know my estimated wait time
  ßß
Scenario: students signs up for “drop-in”
  Given I am on the "sign up" page
  When I fill the form and click "Submit"
  Then I should see a wait time of "30 min"

  
#student email confirmation should have abiltiy to cancel I think

