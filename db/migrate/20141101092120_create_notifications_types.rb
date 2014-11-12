class CreateNotificationsTypes < ActiveRecord::Migration
  def change
    create_table :notifications_types do |t|
      t.string :name
      t.string :subject
      t.string :object
      t.timestamps
    end
  end
end
