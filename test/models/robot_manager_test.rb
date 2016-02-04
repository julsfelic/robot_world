require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_can_create_a_robot
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

  def test_it_finds_all_robots
    create_robots(3)

    assert_equal 3, robot_manager.all.count

    robot_manager.all.each do |robot|
      assert_instance_of Robot, robot
      assert_equal "Robot #{robot.id}", robot.name
    end
  end

  def test_it_finds_a_specific_robot
    create_robots(3)

    ids = robot_manager.all.map { |robot| robot.id }

    ids.each_with_index do |id, index|
      robot = robot_manager.find(id)
      assert_equal id, robot.id
      assert_equal "Robot #{index + 1}", robot.name
      assert_equal "Chicago #{index + 1}", robot.city
    end
  end

  def test_it_updates_a_robot_record
    create_robots(3)

    robot_manager.update({ "name" => "Otilio" }, 2)

    updated_robot = robot_manager.find(2)

    assert_equal "Otilio", updated_robot.name
  end
end
