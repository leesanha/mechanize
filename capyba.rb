require 'mechanize'
require 'open-uri'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
# require 'capybara/poltergeist'


# include Capybara::DSL
World(Capybara::DSL)
# Capybara.server = :serlenium
# Capybara.default_driver = :selenium_chrome_headless

visit "http://info.childcare.go.kr/info/pnis/search/NurseryNameSlL.jsp"
within ("div.option_con2") do
    fill_in '#crname', with: 'abc'
end