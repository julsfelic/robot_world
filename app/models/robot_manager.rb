require 'yaml/store'
require_relative 'robot'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total']  ||= 0
      database['total']  += 1
      database['robots'] << {
        "id"         => database['total'],
        "name"       => robot[:name],
        "city"       => robot[:city],
        "state"      => robot[:state],
        "avatar"     => robot[:avatar],
        "birthday"   => robot[:birthday],
        "date_hired" => robot[:date_hired],
        "department" => robot[:department]
      }
    end
  end

  def raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_robots.map { |raw_robot| Robot.new(raw_robot) }
  end

  def raw_robot(id)
    raw_robots.find { |raw_robot| raw_robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(data, id)
    database.transaction do
      robot = database['robots'].find { |robot| robot["id"] == id }
      robot.merge!(data)
    end
  end

  def delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end
end
