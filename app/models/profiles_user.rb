class ProfilesUser < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "175x175#", :thumb => "100x100>" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
