class AddIndexToExercisesTrainers < ActiveRecord::Migration
  def change
  	add_index :exercises_trainers, [:exercise_id, :trainer_id], unique: true
    add_index :exercises_trainers, [:trainer_id, :exercise_id], unique: true
  end
end
