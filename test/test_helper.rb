ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp
Capybara.save_and_open_page_path = "tmp/capybara"

DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/robot_world_test.sqlite3")}].strategy = :truncation

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

  def find_last_robot
    robot_manager.all.last
  end

  def setup
    DatabaseCleaner.start
    super
  end


  def teardown
    DatabaseCleaner.clean
    super
  end

  def robot_manager
    database = Sequel.sqlite('db/robot_world_test.sqlite3')
    @robot_manager ||= RobotManager.new(database)
  end
end
