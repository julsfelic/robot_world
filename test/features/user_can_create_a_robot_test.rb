require_relative '../test_helper'

class UserCanCreateARobotTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    visit '/robots'
    click_link 'Add Robot'

    assert_equal '/robots/new', current_path
    
    fill_in "robot[name]", with: "Julian"
    fill_in "robot[city]", with: "Chicago"
    fill_in "robot[state]", with: "Illinois"
    fill_in "robot[avatar]", with: "2348"
    fill_in "robot[birthday]", with: "06/18/1989"
    fill_in "robot[date_hired]", with: "11/30/2015"
    fill_in "robot[department]", with: "Software Development"
    click_button 'Create Robot'

    assert_equal '/robots', current_path
    assert page.has_content? 'Julian'
  end
end
