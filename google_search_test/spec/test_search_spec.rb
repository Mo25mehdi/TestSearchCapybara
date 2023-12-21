# spec/test_search_spec.rb
require "spec_helper"
require_relative "./pages/test_search_page"

describe "Test Search", type: :feature do
  let(:google_search_page) { GoogleSearchPage.new }

  before { google_search_page.visit_google }

  it "searches for a term on Google and checks Wikipedia result" do
    google_search_page.search_for("Capybara")
    expect(google_search_page).to have_results_for("Capybara")
    expect(google_search_page).to have_wikipedia_result("Capybara")
  end

  # Yahoo Search
  it "searches for 'Clover Network' on Yahoo and clicks on the result" do
    google_search_page.visit_yahoo_and_search("Clover Network")
    google_search_page.click_on_connect_clover
    expect(page).to have_content("connect.clover.com")
  end
end
