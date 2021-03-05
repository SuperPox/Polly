class ResponsesController < ApplicationController

    get '/responses' do
        @response = Response.all
        erb :'responses/index'
    end

    post '/responses' do
        response = Response.create
        response.save

        



        binding.pry
        redirect :"responses/#{response.id}"
    end

    get '/responses/:id' do
        @response = Response.find_by(id: params[:id])
        if @response == nil
            redirect :'/responses'
        end
        erb :'responses/show'
    end

end