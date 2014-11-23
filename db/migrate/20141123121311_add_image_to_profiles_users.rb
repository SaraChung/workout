class AddImageToProfilesUsers < ActiveRecord::Migration
  def up
    add_attachment :profiles_users, :image
  end

  def down
    remove_attachment :profiles_users, :image
  end
end
