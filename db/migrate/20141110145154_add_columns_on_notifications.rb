class AddColumnsOnNotifications < ActiveRecord::Migration
  def up
    add_column :notifications, :object_hash, :string, :default => ''
    add_column :notifications, :url, :string, :default => ''
  end

  def down
    remove_column :notifications, :object_hash, :string, :default => ''
    remove_column :notifications, :url, :string, :default => ''
  end
end
