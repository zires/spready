require 'sinatra/base'
require 'sinatra/reloader'
require 'yaml'

class SpreadyConfig < Sinatra::Base
  set :public_folder, settings.root + '/static'
  set :views, settings.root + '/static'

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/update_configuration' do
    File.open('sp_config.yml','w') do |out|
      YAML.dump(params[:config], out)
    end
    'xxxx'
  end

end 