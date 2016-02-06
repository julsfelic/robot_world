require_relative '../test_helper'

class UserCanDeleteARobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_deleted_successfully
    create_robots(1)

    visit '/robots'

    assert page.has_content? 'Robot 1'
    click_link 'Robot 1'

    click_button 'Delete Robot'

    assert_equal '/robots', current_path
    refute page.has_content? 'Robot 1'
  end
end
