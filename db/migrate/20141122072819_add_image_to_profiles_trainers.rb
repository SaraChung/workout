class AddImageToProfilesTrainers < ActiveRecord::Migration
  def up
    add_attachment :profiles_trainers, :image
  end

  def down
    remove_attachment :profiles_trainers, :image
  end
end
