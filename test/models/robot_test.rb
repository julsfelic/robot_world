require 'test_helper'

class RobotTest < Minitest::Test
  def test_robot_attributes_assigned_correctly
    data = {
      "id" => 1,
      "name" => "Julian",
      "city" => "Chicago",
      "state" => "Illinois",
      "avatar" => "234f",
      "birthday" => "1989-06-18",
      "date_hired" => "2015-11-30",
      "department" => "Software Development"
    }

    robot = Robot.new(data)

    assert_equal 1, robot.id
    assert_equal "Julian", robot.name
    assert_equal "Chicago", robot.city
    assert_equal "Illinois", robot.state
    assert_equal "234f", robot.avatar
    assert_equal "1989-06-18", robot.birthday
    assert_equal "2015-11-30", robot.date_hired
    assert_equal "Software Development", robot.department
  end
end
