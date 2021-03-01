class PollsController < ApplicationController

    post '/polls' do
        binding.pry
        poll = Poll.create(params[:poll])
        redirect "polls/#{poll.id}"
    end

    get '/polls/:id' do
        @poll = Poll.find_by(id: params [:id])
        if !@poll
            redirect '/polls'
        end
        erb :'polls/show'
    end
end