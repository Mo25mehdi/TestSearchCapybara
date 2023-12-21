# TestSearchCapybara

The test is designed to perform searches on both Google and Yahoo search engines, utilizing Capybara for browser automation. The specific steps are as follows:

Google Search:

Navigate to the Google homepage.
Perform a search for the term "Capybara."
Verify that the search results page contains information related to "Capybara," specifically checking for a Wikipedia result.
Yahoo Search:

Navigate to the Yahoo homepage.
Perform a search for the term "Clover Network."
Click on the submit button to view the search results.
Look for a result that contains the link "connect.clover.com."

SETUP
1. Make a directory for the project
2. Initilaize New Ruby project
   bundle init
3. Open gemfile and add necessary gems along with other gems required for drivers
  Example:
  source "https://rubygems.org"
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec"
4. install the gems
   bundle install
5. Configure Cpaybara by editing spec_helper.rb in the spec directory
    require "capybara/rspec"
    require "selenium-webdriver"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = "https://www.google.com"
end 
6. To run the test use the command: rspec
