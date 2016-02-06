require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_can_create_a_robot
    create_robots(1)

    robot = robot_manager.all.last

    assert robot.id
    assert_equal "Robot 1",        robot.name
    assert_equal "Chicago 1",      robot.city
    assert_equal "Illinois 1",     robot.state
    assert_equal "23j41",          robot.avatar
    assert_equal "2011-03-18",     robot.birthday
    assert_equal "2100-01-22",     robot.date_hired
    assert_equal "Software Dev 1", robot.department
  end

  def test_it_finds_all_robots
    create_robots(3)

    assert_equal 3, robot_manager.all.count

    robot_manager.all.each_with_index do |robot, index|
      assert_instance_of Robot, robot
      assert_equal "Robot #{index + 1}", robot.name
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
    robot_id = find_last_robot.id

    robot_manager.update({ "name" => "Otilio" }, robot_id)

    updated_robot = robot_manager.find(robot_id)

    assert_equal "Otilio", updated_robot.name
  end

  def test_it_deletes_a_robot_record
    create_robots(3)
    robot_id = find_last_robot.id

    initial_count = robot_manager.all.count

    robot_manager.delete(robot_id)

    final_count = robot_manager.all.count

    assert_equal 1, (initial_count - final_count)
  end
end
