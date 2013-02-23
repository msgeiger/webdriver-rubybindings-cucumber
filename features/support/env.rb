#!/bin/env ruby

require 'rubygems'
require 'bundler'

Bundler.require(:default, :test_frameworks, :debugging)

require "cucumber/formatter/unicode"

if ENV["FIREFOX"] then
  browser = Selenium::WebDriver.for(:firefox)

elsif ENV["CHROME"] then
  browser = Selenium::WebDriver.for(:chrome)

elsif ENV["IE"] then
  browser = Selenium::WebDriver.for(:ie)
  wd_wait = Selenium::WebDriver::Wait.new(:timeout => 30) #ENV["TIMEOUT"] 
  wd_url = ENV["URL"]
  
  #caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer(
    #:javascript_enabled => false, 
    #:version => version)
    #@wd_driver = Selenium::WebDriver.for(
    #:remote, :url => host, 
    #:desired_capabilities => caps)
end

if ENV["DEMO"] then
  $loadtestmodeler = "carolmirakove.github.com/loadtestmodeler"
elsif ENV["PRODUCTION"] then
  # placeholder URL; to be updated when deployed as a web app
  $loadtestmodeler = "www.loadtestmodeler.com"
end

module Browser
  def initialize browser, wd_wait
    @browser = browser
    @wd_wait = wd_wait
  end
end # Browser

Before do |scenario|
  @browser = browser
  @wd_wait = wd_wait
  @browser.manage.delete_all_cookies
end

at_exit do
  browser.close
end 
