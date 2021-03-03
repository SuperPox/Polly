class PollsController < ApplicationController

    get '/polls/index' do
        @poll = Poll.all
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

        contentV = []
        if (params[:pa1] != nil)
            contentV << params[:pa1]
        end
        if (params[:pa2] != nil)
            contentV << params[:pa2]
        end
        if (params[:pa3] != nil)
            contentV << params[:pa3]
        end
        if (params[:pa4] != nil)
            contentV << params[:pa4]
        end
        contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]     
        contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)       
            poll.questions[0].possible_answers << possible_answer_instance      
            poll.questions[0].save
            poll.questions << poll.questions[0]
            poll.save
        end

        q2_pa_contentV = []
        if (params[:pa5] != nil)
            q2_pa_contentV << params[:pa5]
        end
        if (params[:pa6] != nil)
            q2_pa_contentV << params[:pa6]
        end
        if (params[:pa7] != nil)
            q2_pa_contentV << params[:pa7]
        end
        if (params[:pa8] != nil)
            q2_pa_contentV << params[:pa8]
        end
        q2_pa_contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]     
        q2_pa_contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)     
            poll.questions[1].possible_answers << possible_answer_instance      
            poll.questions[1].save
            poll.questions << poll.questions[1]
            poll.save
        end

        q3_pa_contentV = []
        if (params[:pa9] != nil)
            q3_pa_contentV << params[:pa9]
        end
        if (params[:pa10] != nil)
            q3_pa_contentV << params[:pa10]
        end
        if (params[:pa11] != nil)
            q3_pa_contentV << params[:pa11]
        end
        if (params[:pa12] != nil)
            q3_pa_contentV << params[:pa12]
        end
        q3_pa_contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]     
        q3_pa_contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)        
            poll.questions[2].possible_answers << possible_answer_instance      
            poll.questions[2].save
            poll.questions << poll.questions[2]
            poll.save
        end

        q4_pa_contentV = []
        if (params[:pa13] != nil)
            q4_pa_contentV << params[:pa13]
        end
        if (params[:pa14] != nil)
            q4_pa_contentV << params[:pa14]
        end
        if (params[:pa15] != nil)
            q4_pa_contentV << params[:pa15]
        end
        if (params[:pa16] != nil)
            q4_pa_contentV << params[:pa16]
        end
        q4_pa_contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]     
        q4_pa_contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)        
            poll.questions[3].possible_answers << possible_answer_instance      
            poll.questions[3].save
            poll.questions << poll.questions[3]
            poll.save
        end

        q5_pa_contentV = []
        if (params[:pa17] != nil)
            q5_pa_contentV << params[:pa17]
        end
        if (params[:pa18] != nil)
            q5_pa_contentV << params[:pa18]
        end
        if (params[:pa19] != nil)
            q5_pa_contentV << params[:pa19]
        end
        if (params[:pa20] != nil)
            q5_pa_contentV << params[:pa20]
        end
        q5_pa_contentV.to_s.gsub("\"", "")  #=> ["cat", "dog", "bird", "other"]     
        q5_pa_contentV.each do |i|
            possible_answer_hash = {content: i}
            possible_answer_instance = PossibleAnswer.create(possible_answer_hash)        
            poll.questions[4].possible_answers << possible_answer_instance      
            poll.questions[4].save
            poll.questions << poll.questions[4]
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

    
    get '/polls/:id/take' do
        @poll = Poll.find_by(id: params[:id])
        
        erb :'polls/take'
    end





end