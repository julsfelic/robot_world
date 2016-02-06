require_relative '../test_helper'

class UserCanViewASingleRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_shows_a_single_robot_when_clicked_from_the_robots_page
    create_robots(1)
    robot_id = find_last_robot.id

    visit '/robots'
    click_link 'Robot 1'

    assert_equal "/robots/#{robot_id}", current_path
    within('h1') do
      assert page.has_content? 'Robot 1'
    end
    assert page.has_content? 'Chicago 1'
  end
end
