class CreateProfilesUsers < ActiveRecord::Migration
  def change
    create_table :profiles_users do |t|
      t.integer :user_id, null: false
      t.text :interests
      t.text :about
      t.string :quotes
      t.datetime :birthdate
      t.timestamps
    end
  end
end
