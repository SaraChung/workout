class Notification < ActiveRecord::Base
  belongs_to :notifications_type
  
  default_scope { eager_load("notifications_type") }
  scope :trainer_feeds, -> (id) { where("notifications_types.object = 'Trainer' AND object_id = ?", id) }
end
