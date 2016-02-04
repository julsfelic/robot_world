ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp
Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelpers
  def create_robots(num)
    num.times do |i|
      robot_manager.create({
        name:       "Robot #{i + 1}",
        city:       "Chicago #{i + 1}",
        state:      "Illinois #{i + 1}",
        avatar:     "23j4#{i + 1}",
        birthday:   "201#{i + 1}-03-18",
        date_hired: "2#{i + 1}00-01-22",
        department: "Software Dev #{i + 1}"
      })
    end
  end


  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    database = YAML::Store.new('db/robot_manager_test')
    @robot_manager ||= RobotManager.new(database)
  end
end
