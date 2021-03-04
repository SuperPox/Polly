class User < ActiveRecord::Base
    has_many :polls
    has_many :responses
    has_secure_password
end