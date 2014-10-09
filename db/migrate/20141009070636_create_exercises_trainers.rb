class CreateExercisesTrainers < ActiveRecord::Migration
  def change
    create_table :exercises_trainers, id: false do |t|
      t.integer :trainer_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end
