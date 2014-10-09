class CreateProfilesTrainers < ActiveRecord::Migration
  def change
    create_table :profiles_trainers do |t|
      t.integer :trainer_id, null: false
      t.text :interests
      t.text :about
      t.string :workout_quotes
      t.datetime :birthdate
      t.timestamps
    end
  end
end
