require 'bundler'
Bundler.require

APP_ROOT = File.expand_path('..', __dir__)

Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each do |file|
  require file
end

Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each do |file|
  require file
end

class RobotWorldApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end
