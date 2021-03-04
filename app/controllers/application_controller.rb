require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    @name = "User"
    erb :welcome
  end

  get "/polls/new" do
    @name = "User"
    erb :'/polls/new'
  end
end
