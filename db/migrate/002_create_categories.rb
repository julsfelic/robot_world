require 'sequel'

environments = ['test', 'development']

environments.each do |env|
  database = Sequel.sqlite("db/robot_world_#{env}.sqlite3")
  database.create_table(:categories) do
    primary_key :id
    String      :name
    String      :description
  end
end
