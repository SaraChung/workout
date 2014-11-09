class RenameObjectIdOnNotif < ActiveRecord::Migration
  def up
    rename_column :notifications, :object_id, :obj_id
  end

  def down
    rename_column :notifications, :obj_id, :object_id
  end
end
