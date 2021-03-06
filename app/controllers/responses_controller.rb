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

    get '/responses/:id/show' do
        redirect_if_not_logged_in
        @poll = Poll.find_by(id: params[:id])
        if @poll == nil
            redirect :'/polls'
        end
        @responses = @poll.questions[0].possible_answers[0][:taker] 
        erb :'responses/show'
    end

end