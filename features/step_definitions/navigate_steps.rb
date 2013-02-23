When /^I visit the marineby\.com home page$/ do

    wdriver = Snippets.new(@browser, @wd_wait) 
    testing_url = 'http://www.marinebay.com'
    url = [
      "#{testing_url}/browse/boats",
      "#{testing_url}/browse/boatengines",
      "#{testing_url}/browse/trailers"
    ]
   
   ids = [
     {:id => "title_navigation"},
     {:id => "main_title"}
   ]


    url.each do |page|
      wdriver.open_page page 
      ids.each do |element|
        wdriver.wait_for_element_present({:id=>'title_navigation'}) 
        puts element
      end
    end
end

Then /^I should see the title bar$/ do
        wdriver = Snippets.new(@browser, @wd_wait) 
        wdriver.wait_for_element_present({:id=>'title_navigation'}) 
end

Then /^I should see the title description$/ do
        wdriver = Snippets.new(@browser, @wd_wait) 
        wdriver.wait_for_element_present({:id=>'main_title'}) 
end

