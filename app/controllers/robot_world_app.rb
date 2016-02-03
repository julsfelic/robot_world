require "models/robot_manager"

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    # grab robots from RobotManager model
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  def robot_manager
    database = YAML::Store.new('db/robot_manager')
    @robot_manager ||= RobotManager.new(database)
  end
end
