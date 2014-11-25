class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :trainer
  belongs_to :exercise

  default_scope { eager_load(:user, :trainer, :exercise) }
  scope :whose, -> (trainer_id) { where trainer_id: trainer_id }
  scope :whose_user, -> (user_id) { where user_id: user_id }
  scope :accepted, -> { where status: true }
  scope :declined, -> { where status: false }
  scope :past_workouts, -> { where("to_when < ?", Time.now) }
  scope :upcoming_workouts, -> { where("to_when > ?", Time.now) }

  def status
    self.status? ? "Accepted" : "Declined"
  end

  def is_private
    self.is_private? ? "Yes" : "No"
  end
end
