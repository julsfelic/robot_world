class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/robots' do
    # grab robots from RobotManager model
    @robots = ["Robot 1", "Robot 2", "Robot 3"]
    erb :index
  end

  get '/robots/new' do
    erb :new
  end
end
