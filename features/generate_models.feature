Feature: Generate load test models

Background: 
  Given I have loaded the home page

@smoke
Scenario Outline: Generate a load test model with each load type
  When I select a load type with a value of <load_type>
  * I submit the form with <num_page_views_per_hour> page views per hour, <num_prod_app_servers> production application servers, <num_test_app_servers> test application servers, and an average session duration of <avg_session_duration> seconds
  Then I should see load test model output

  Scenarios:
  | load_type | num_page_views_per_hour | num_prod_app_servers | num_test_app_servers | avg_session_duration | 
  | average | 100 | 6 | 3 | 210 |
  | peakCurrent | 86342 | 14 | 4 | 180 |
  | peakProjected | 62 | 3 | 1 | 60 |
  | stress | 172000 | 14 | 4 | 47 |


 @wip
 Scenario: Error handling: required fields are not filled in
  When 
  Then 

 @wip
 Scenario: Error handling: fields do not contain numbers
  When 
  Then 
