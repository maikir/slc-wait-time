Feature: view next student in line
  
  As a tutor
  So that I can decide which student to work with
  I want to see who is next in line
  Background: student requests in database
 
  Given the following student queues exist:
  | student_id | waiting? | created_at
  | 25804240   | true     | 2012-09-10 14:44:24 UTC
  | 00000000   | false    | 2011-09-10 14:44:24 UTC
  | 25804241   | true     | 2013-09-10 14:44:24 UTC
  | 25804242   | true     | 2014-09-10 14:44:24 UTC
  
  Given the following students exist:
  | sid | first_name | last_name
  | 25804240   | Alex     | Yang
  | 00000000   | Haggai   | Kaunda
  | 25804241   | Maiki     | Rainton
  | 25804242   | Nahrae     | Seok

Scenario: list of students in line
  #   Given I am logged in as a tutor
  Given I am on the student line page
  Then I should see a list of students
 
# Scenario: see no students
#   Given I am logged in as a tutor
    And I am on the student line page
    # Then I should see "Alex Yang" before "Maiki Rainton"
    # And I should see "Alex Yang" before "Nahrae Seok"
  
