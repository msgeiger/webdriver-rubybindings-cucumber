#!/bin/env ruby

require 'rubygems'
require 'bundler'
require 'yaml'

class TestVariables
  credentials_file = File.dirname(__FILE__)+"/../../credentials.yml"
  PARSED = YAML.load_file( credentials_file )
end

module Credentials
  def initialize
    @parsed = TestVariables::PARSED 
  end

  def get_username
    username = @parsed['credentials'][0]['username']
  end

  def get_password
    password = @parsed['credentials'][1]['password']
  end 
  
  def get_pin
    pin = @parsed['credentials'][2]['pin']
  end 

  def get_environment_url
    pin = @parsed['credentials'][3]['env_url']
  end 
end

module EnvironmentVars
  def initialize
    @parsed = TestVariables::PARSED 
  end

  def get_env_url
    env_url = @parsed['environment_vars'][0]['env_url']
  end
end

class User 
  include Credentials
end

class Configuration
  include EnvironmentVars
end

ENV_URL = Configuration.new().get_env_url

Bundler.require(:default, :test_frameworks, :debugging)

require "cucumber/formatter/unicode"

if ENV["FIREFOX"] then
  browser = Selenium::WebDriver.for(:firefox)
  wd_wait = Selenium::WebDriver::Wait.new(:timeout => 120) #ENV["TIMEOUT"] 
  wd_url = ENV["URL"]

elsif ENV["CHROME"] then
  browser = Selenium::WebDriver.for(:chrome)
  wd_wait = Selenium::WebDriver::Wait.new(:timeout => 120, :javascript_enabled => true) #ENV["TIMEOUT"] 
  wd_url = ENV["URL"]

elsif ENV["PHANTOMJS"] then
  browser = Selenium::WebDriver.for(:phantomjs)
  wd_wait = Selenium::WebDriver::Wait.new(:timeout => 120) #ENV["TIMEOUT"] 
  wd_url = ENV["URL"]

elsif ENV["IE"] then
  browser = Selenium::WebDriver.for(:ie)
  wd_wait = Selenium::WebDriver::Wait.new(:timeout => 120) #ENV["TIMEOUT"] 
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
    @wd_url = wd_url
  end
end # Browser

Before do |scenario|
  @browser = browser
  @wd_wait = wd_wait
  @wd_url = wd_url
  @browser.manage.delete_all_cookies
  WEBDRIVER = Snippets.new(@browser, @wd_wait)
end

at_exit do
  browser.close
end 
