# spec/pages/test_search_page.rb
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

  def first_result_text
    first("div.rc")&.text
  end

  def has_wikipedia_result?(query)
    has_selector?("a[href*='https://en.wikipedia.org']", text: query)
  end

  def visit_yahoo_and_search(query)
    visit "https://www.yahoo.com/"
    fill_in "p", with: query
    click_button "Search"
  end

  def click_on_connect_clover
    first("a", text: "connect.clover.com").click
  end
end
