Feature: enter line for help
  
  As a student
  So that I can receive help with my writing
  I want to get in line
  
Before('@not_in_line') do
  Given "Jennifer" "Be" is on the wait time page
end

Before('@already_in_line') do
  Given "Jennifer" "Be" is already in line
  Given "Jennifer" "Be" is on the wait time page
end

@not_in_line
Scenario: Jennifer wants to wait in line
  And she clicks on "yes"
  Then she should be on the confirmation page
  And she should see "you are in line"
  And she should not see "Hope to see you soon"

@not_in_line
Scenario: Jennifer doesn't want to wait in line
  And she clicks on "no"
  Then she should should not be on the confirmation page
  And she should see "Hope to see you soon"
  And she should not see "you are in line"
  
@already_in_line
Scenario: given Jennifer is already in line
  Given she clicks on "yes"
  Then she should be on the home page
  And she should see "You are already in line Jennifer"
  