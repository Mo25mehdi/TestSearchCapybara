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
```
  source "https://rubygems.org"
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec"
```

4. install the gems
```
bundle install
```


5. Configure Cpaybara by editing spec_helper.rb in the spec directory
```
require "capybara/rspec"
require "selenium-webdriver"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = "https://www.google.com"
end 
```

6. To run the test use the command:
   ```
   rspec
```


You can also make the test data driven

```
# spec/pages/google_search_page.rb

class GoogleSearchPage
  include Capybara::DSL

  def visit_google
    visit "https://www.google.com/"
  end

  def search_for(query)
    fill_in "q", with: query
    click_button "Google Search"
  end

  def has_results_for?(query)
    has_content?(query)
  end

  def has_wikipedia_result?(query)
    has_selector?("a[href*='https://en.wikipedia.org']", text: query)
  end

  def first_result_text
    first("div.rc")&.text
  end
end
```


```
# spec/google_search_spec.rb

require "spec_helper"
require_relative "./pages/google_search_page"

describe "Google Search", type: :feature do
  let(:google_search_page) { GoogleSearchPage.new }

  before { google_search_page.visit_google }

  test_data = [
    ["Capybara", "Capybara - Wikipedia"],
    ["Ruby", "Ruby Programming Language - Wikipedia"]
    # Add more data as needed
  ]

  test_data.each do |query, expected_result|
    context "searches for '#{query}'" do
      it "displays the expected result" do
        google_search_page.search_for(query)
        expect(google_search_page).to have_results_for(expected_result)
        expect(google_search_page).to have_wikipedia_result(expected_result)
      end
    end
  end
end
```
