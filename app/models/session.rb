class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer

  default_scope { eager_load(:users, :trainers) }
  scope :whose, -> (trainer_id) { where trainer_id: trainer_id }
  scope :accepted, -> { where status: true }
  scope :declined, -> { where status: false }
  scope :past_workouts, -> { where("to_when < ?", Time.now) }
  scope :upcoming_workouts, -> { where("to_when > ?", Time.now) }
end
