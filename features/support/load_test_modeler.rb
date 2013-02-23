class LoadTestModeler
  include Browser

  def load_home_page
    @browser.navigate.to "http://#{$loadtestmodeler}/"
  end

  def assert_home_page_assets
    @browser.find_element(:id => "logo")
    @browser.find_element(:id => "footer")
    @browser.find_element(:id => "loadType")
  end

end # LoadTestModeler
