class NotificationsType < ActiveRecord::Base
  has_many :notifications

  scope :what_id, -> (name) { where("name = ?", name).pluck(:id)[0] }
end
