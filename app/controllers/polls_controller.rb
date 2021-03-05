class PollsController < ApplicationController

    get '/polls/index' do
        redirect_if_not_logged_in
        @poll = Poll.all
        erb :'polls/index'      
    end

    get 'polls/my' do
        binding.pry
        redirect_if_not_logged_in
        @poll = 
        erb :'polls/my'
    end

    get '/polls' do
        redirect_if_not_logged_in
        @poll = Poll.all
        erb :'polls/index'
    end

    post '/polls' do
        redirect_if_not_logged_in       
       
        poll = Poll.create(params[:id])
        poll.save

        user = User.find_by(id: session[:user_id])
        user.polls << poll
        user.save

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
        redirect_if_not_logged_in
        @poll = Poll.find_by(id: params[:id])
        if @poll == nil
            redirect :'/polls'
        end
        erb :'polls/show'
    end

    ########################################
    get '/polls/:id/edit' do
        redirect_if_not_logged_in
        @poll = Poll.find_by(id: params[:id])
        if @poll == nil || @poll.user_id != session[:user_id]
            redirect :'/polls'
        end
        erb :'polls/edit'
    end

    patch '/polls/:id' do
        redirect_if_not_logged_in
        @poll = Poll.find_by(id: params[:id])  
        if @poll.user_id == session[:user_id]
            editedTitleHash = {title: params[:t1]}
            @poll.update(editedTitleHash)

            eQ1 = {content: params[:q1]}
            @poll.questions[0].update(eQ1)
            eQ2 = {content: params[:q2]}
            @poll.questions[1].update(eQ2)
            eQ3 = {content: params[:q3]}
            @poll.questions[2].update(eQ3)
            eQ4 = {content: params[:q4]}
            @poll.questions[3].update(eQ4)
            eQ5 = {content: params[:q5]}
            @poll.questions[4].update(eQ5)

            pA1 = {content: params[:pa1]}
            @poll.questions[0].possible_answers[0].update(pA1)
            pA2 = {content: params[:pa2]}
            @poll.questions[0].possible_answers[1].update(pA2)
            pA3 = {content: params[:pa3]}
            @poll.questions[0].possible_answers[2].update(pA3)
            pA4 = {content: params[:pa4]}
            @poll.questions[0].possible_answers[3].update(pA4)

            pA5 = {content: params[:pa5]}
            @poll.questions[1].possible_answers[0].update(pA5)
            pA6 = {content: params[:pa6]}
            @poll.questions[1].possible_answers[1].update(pA6)
            pA7 = {content: params[:pa7]}
            @poll.questions[1].possible_answers[2].update(pA7)
            pA8 = {content: params[:pa8]}
            @poll.questions[1].possible_answers[3].update(pA8)

            pA9 = {content: params[:pa9]}
            @poll.questions[2].possible_answers[0].update(pA9)
            pA10 = {content: params[:pa10]}
            @poll.questions[2].possible_answers[1].update(pA10)
            pA11 = {content: params[:pa11]}
            @poll.questions[2].possible_answers[2].update(pA11)
            pA12 = {content: params[:pa12]}
            @poll.questions[2].possible_answers[3].update(pA12)

            pA13 = {content: params[:pa13]}
            @poll.questions[3].possible_answers[0].update(pA13)
            pA14 = {content: params[:pa14]}
            @poll.questions[3].possible_answers[1].update(pA14)
            pA15 = {content: params[:pa15]}
            @poll.questions[3].possible_answers[2].update(pA15)
            pA16 = {content: params[:pa16]}
            @poll.questions[3].possible_answers[3].update(pA16)

            pA17 = {content: params[:pa17]}
            @poll.questions[4].possible_answers[0].update(pA17)
            pA18 = {content: params[:pa18]}
            @poll.questions[4].possible_answers[1].update(pA18)
            pA19 = {content: params[:pa19]}
            @poll.questions[4].possible_answers[2].update(pA19)
            pA20 = {content: params[:pa20]}
            @poll.questions[4].possible_answers[3].update(pA20)
        end
        erb :'polls/show'
    end
    ##########################################

    delete '/polls/:id' do
        redirect_if_not_logged_in
        @poll = Poll.find_by(id: params[:id])
        if @poll.user_id == session[:user_id]
            @poll.delete
            redirect('/polls')
        else
            erb :'items/show'
        end
        
    end

    ##########################################
    get '/polls/:id/take' do
        @poll = Poll.find_by(id: params[:id])
        if @poll == nil
            redirect :'/polls'
        end
        erb :'polls/take'
    end
end