require 'watir'
require 'selenium-webdriver'
require 'chromedriver-helper'

chromedriver_path = Selenium::WebDriver.for :chrome
puts "Using chromedriver at #{chromedriver_path}"

browser = Watir::Browser.new
# browser.goto 'watir.com'
# browser.link(text: 'Guides').click

# puts browser.title
# # => 'Guides – Watir Project'
# browser.close