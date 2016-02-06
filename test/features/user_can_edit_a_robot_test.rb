require_relative '../test_helper'

class UserCanEditARobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_updated_with_new_information
    create_robots(1)
    robot_id = find_last_robot.id

    visit "/robots/#{robot_id}/edit"

    fill_in 'robot[name]', with: 'Julian'
    fill_in 'robot[city]', with: 'New York City'
    fill_in 'robot[state]', with: 'New York'
    click_button 'Edit Robot'

    assert_equal "/robots/#{robot_id}", current_path
    within('h1') do
      assert page.has_content? 'Julian'
    end
    assert page.has_content? 'New York City'
    assert page.has_content? 'New York'
  end
end
