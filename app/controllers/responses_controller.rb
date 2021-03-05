class ResponsesController < ApplicationController

    get '/responses' do
        @response = Response.all
        erb :'responses/index'
    end

    post '/responses' do
        user = User.find_by(id: session[:user_id])
        response = Response.create
        response.save   
        erb :'responses/confirm'
        #redirect :"responses/#{response.id}"
    end

    get '/responses/:id' do

        @response = Response.find_by(id: params[:id])
        if @response == nil
            redirect :'/responses'
        end
        erb :'responses/show'
    end

end