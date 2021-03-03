class Poll < ActiveRecord::Base
    belongs_to :user
    has_many :questions
    has_many :possible_answers, through: :questions

end