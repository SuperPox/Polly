class PollsController < ApplicationController

    get '/polls' do
        @polls = Polls.all
        erb :'polls/index'      
    end



    post '/polls' do       
        #=>params{"id"=>{"title"=>"Favorite Pet"}, "question"=>{"content"=>""}, "pa1"=>"", "pa2"=>"", etc.
        poll = Poll.create(params[:id])
        poll.save

        questionContentV = []
        if (params[:q1] != nil)
            questionContentV << params[:q1]
        end
        if (params[:q2] != nil)
            questionContentV << params[:q2]
        end
        if (params[:q3] != nil)
            questionContentV << params[:q3]
        end
        if (params[:q4] != nil)
            questionContentV << params[:q4]
        end
        if (params[:q5] != nil)
            questionContentV << params[:q5]
        end
        questionContentV.to_s.gsub("\"", "")
        questionContentV.each do |i|
            each_question_hash = {content: i}
            question_instance = Question.create(each_question_hash)
            question_instance.save
            poll.questions << question_instance
            poll.save
        end


        binding.pry

        contentV = []
        if (params[:pa1] != nil)
            contentV << params[:pa1]
        end
        if (params[:pa2] != nil)
            contentV << params[:pa3]
        end
        if (params[:pa4] != nil)
            contentV << params[:pa4]
        end
        if (params[:pa4] != nil)
            contentV << params[:pa4]
        end
        contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]
        contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)
            question.possible_answers << possible_answer_instance      
            question.save
            poll.questions << question
            poll.save
        end

        redirect :"polls/#{poll.id}"
    end
    
    get '/polls/:id' do
        @poll = Poll.find_by(id: params[:id])
        if @poll == nil
            redirect :'/polls'
        end
        erb :'polls/show'
    end
end