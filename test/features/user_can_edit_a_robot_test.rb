require_relative '../test_helper'

class UserCanEditARobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_updated_with_new_information
    create_robots(1)

    visit '/robots/1/edit'

    fill_in 'robot[name]', with: 'Julian'
    fill_in 'robot[city]', with: 'New York City'
    fill_in 'robot[state]', with: 'New York'
    click_button 'Edit Robot'

    assert_equal '/robots/1', current_path
    within('h1') do
      assert page.has_content? 'Julian'
    end
    assert page.has_content? 'New York City'
    assert page.has_content? 'New York'
  end
end
