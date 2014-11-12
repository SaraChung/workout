class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :notifications_type_id
      t.integer :subject_id
      t.integer :object_id
      t.string :title
      t.string :short_message
      t.string :long_message
      t.boolean :is_read, default: false
      t.timestamps
    end
  end
end
