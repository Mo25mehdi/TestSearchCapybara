# spec/spec_helper.rb
require "capybara/rspec"
require "selenium-webdriver"

# Additional configuration for RSpec
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

# Capybara configuration
Capybara.configure do |config|
  config.run_server = false

  # Use Selenium with headless Chrome for both JavaScript and non-JavaScript tests
  config.default_driver = :selenium_chrome

  # Register the driver with options
  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless")
    options.add_argument("--disable-gpu") # May be necessary

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
