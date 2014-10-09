class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :trainer_id
      t.integer :user_id
      t.string :rating, null: false
      t.string :comments, default: "No comments."
      t.timestamps
    end
  end
end
