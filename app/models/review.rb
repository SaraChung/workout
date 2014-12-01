class Review < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :user

  validates_uniqueness_of :trainer_id, scope: [:user_id]
end
