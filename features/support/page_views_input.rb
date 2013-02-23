class PageViewsInput
  include Browser

  def select_load_type(load_type)
    # TODO abstract wait method so it's accessible to all methods
    # wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
    # @browser.wait.until { @browser.find_element(:id => "loadType") }

    @browser.find_element(:css, "option[value='#{load_type}']").click
  end

  def assert_selected_load_type(load_type)
    @browser.find_element(:css, "option[value='#{load_type}']").selected?
  end

  def fill_in_my_load_test_form(page_views_per_hour,prod_app_servers,test_app_servers,avg_session_duration)
    @browser.find_element(:name, 'pageViewsPerHour').send_keys(page_views_per_hour)
    @browser.find_element(:name, 'numProdAppServers').send_keys(prod_app_servers)
    @browser.find_element(:name, 'numTestAppServers').send_keys(test_app_servers)
    @browser.find_element(:name, 'avgSessionDuration').send_keys(avg_session_duration)
  end

  def submit_my_load_test_form
    @browser.find_element(:name, 'calculateLoadModel').click
  end

end # PageViewsInput

