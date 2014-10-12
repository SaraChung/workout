class ExercisesTrainer < ActiveRecord::Base
	belongs_to :trainer
	belongs_to :exercise
	validates_uniqueness_of :trainer_id, scope: :exercise_id
end
