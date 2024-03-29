class Notification < ActiveRecord::Base
  belongs_to :notifications_type
  
  default_scope { eager_load("notifications_type") }
  scope :trainer_feeds, -> (id) { where("notifications_types.object = 'Trainer' AND obj_id = ?", id).order("notifications.created_at DESC") }
  scope :count_unread_trainer, -> (id) { where("notifications_types.object = 'Trainer' AND obj_id = ? AND is_read = FALSE", id).count }
  scope :user_feeds, -> (id) { where("notifications_types.object = 'User' AND obj_id = ?", id).order("notifications.created_at DESC") }
  scope :count_unread_user, -> (id) { where("notifications_types.object = 'User' AND obj_id = ? AND is_read = FALSE", id).count }

end
