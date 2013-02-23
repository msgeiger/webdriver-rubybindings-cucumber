When /^I (?:load|have loaded) the home page$/ do
  LoadTestModeler.new(@browser).load_home_page
  LoadTestModeler.new(@browser).assert_home_page_assets
end

When /^I (?:select|have selected) a load type with a value of (.+)$/ do |load_type|
  PageViewsInput.new(@browser).select_load_type(load_type)
  PageViewsInput.new(@browser).assert_selected_load_type(load_type)
end

When /^I submit the form with (.+) page views per hour, (.+) production application servers, (.+) test application servers, and an average session duration of (.+) seconds$/ do |num_page_views_per_hour,num_prod_app_servers,num_test_app_servers,avg_session_duration| 
  PageViewsInput.new(@browser).fill_in_my_load_test_form(num_page_views_per_hour,num_prod_app_servers,num_test_app_servers,avg_session_duration)
  PageViewsInput.new(@browser).submit_my_load_test_form
end

Then /^I should see load test model output$/ do
  PageViewsOutput.new(@browser).assert_load_model_output
end
