class PageViewsOutput
  include Browser

  def assert_load_model_output
    @browser.find_element(:id, "pageViewsOutput")
    @browser.find_element(:id, "avgSessionDurationOutput")
  end

end # PageViewsOutput
