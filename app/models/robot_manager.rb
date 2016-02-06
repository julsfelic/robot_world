class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:robots)
  end

  def create(robot)
    dataset.insert(robot)
  end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    data = dataset.where(:id => id).to_a.first
    Robot.new(data)
  end

  def update(data, id)
    dataset.where(:id => id).update(data)
  end

  def delete(id)
    dataset.where(:id => id).delete
  end
end
