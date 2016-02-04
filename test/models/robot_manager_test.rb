require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_robot
    create_robots(1)

    robot = robot_manager.all.last

    assert robot.id
    assert_equal "Robot #{robot.id}",        robot.name
    assert_equal "Chicago #{robot.id}",      robot.city
    assert_equal "Illinois #{robot.id}",     robot.state
    assert_equal "23j4#{robot.id}",          robot.avatar
    assert_equal "201#{robot.id}-03-18",     robot.birthday
    assert_equal "2#{robot.id}00-01-22",     robot.date_hired
    assert_equal "Software Dev #{robot.id}", robot.department
  end
end
