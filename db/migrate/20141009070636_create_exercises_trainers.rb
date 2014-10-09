class CreateExercisesTrainers < ActiveRecord::Migration
  def change
    create_table :exercises_trainers, id: false do |t|
      t.belongs_to :exercise
      t.belongs_to :trainer
    end
  end
end
