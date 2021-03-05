require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  register Sinatra::Flash

  get "/" do    
    redirect_if_not_logged_in
    erb :welcome
  end

  get "/polls/new" do
    @name = "User"
    erb :'/polls/new'
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      redirect '/login' unless current_user
    end

    def check_owner(obj)
      obj.user == current_user
    end
  end
end
