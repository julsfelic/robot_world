require 'sequel'

environments = ['test', 'development']

environments.each do |env|
  database = Sequel.sqlite("db/robot_world_#{env}.sqlite3")
  database.create_table(:robots) do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :avatar
    String      :birthday
    String      :date_hired
    String      :department
  end
end
