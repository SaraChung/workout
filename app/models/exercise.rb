class Exercise < ActiveRecord::Base
	has_many :exercises_trainers
  has_many :trainers, through: :exercises_trainers
  has_many :sessions
end
