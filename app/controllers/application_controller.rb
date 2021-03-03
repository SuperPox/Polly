require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @name = "User"
    erb :welcome
  end

  get "/polls/new" do
    @name = "User"
    erb :'/polls/new'
  end

  get "/polls/setup" do
    @name = "User"
    erb :'/polls/setup'
  end



end
