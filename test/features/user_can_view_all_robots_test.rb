require_relative '../test_helper'

class UserCanViewAllRobotsTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_shows_all_robots_when_visiting_robots_page
    create_robots(3)
    visit '/robots'

    within('h1') do
      assert page.has_content? 'Robots'
    end

    assert page.has_content? 'Robot 1'
    assert page.has_content? 'Robot 2'
    assert page.has_content? 'Robot 3'
  end
end
