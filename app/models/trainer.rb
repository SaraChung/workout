class Trainer < ActiveRecord::Base
  include CustomField
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :address
  
  has_many :exercises_trainers
  has_many :exercises, through: :exercises_trainers
  has_many :sessions
  has_many :users, through: :sessions

  after_validation :geocode
  validates :email, uniqueness: true, presence: true  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  
  scope :relations, -> { eager_load(:exercises, :sessions) }
  scope :skill, -> (id) { relations.where("exercises.id = ?", id) }
  scope :has_session, -> (start_date, end_date) { relations.where("sessions.from_when >= ? AND sessions.to_when <= ?",start_date, end_date) }
  scope :closest_trainer, -> (user_address) { near(user_address, 10, units: :km) }
  scope :available, -> (id, start_date, end_date, trainer_assistant, address) { where("id IN ((SELECT trainers.id FROM trainers LEFT OUTER JOIN exercises_trainers ON exercises_trainers.trainer_id = trainers.id LEFT OUTER JOIN exercises ON exercises.id = exercises_trainers.exercise_id LEFT OUTER JOIN sessions ON sessions.trainer_id = trainers.id WHERE (exercises.id = ?) AND trainers.id NOT IN (SELECT trainers.id FROM trainers LEFT OUTER JOIN sessions ON sessions.trainer_id = trainers.id WHERE (sessions.from_when >= ? AND sessions.to_when <= ?) AND sessions.status = 'true'))) AND trainers.is_trainer = ?", id, start_date, end_date, trainer_assistant).near(address) }
  scope :who_is, -> (id) { where("id = ?", id).pluck(:first_name, :last_name).flatten }
  scope :where_is, -> (email) { where("email = ?", email).pluck(:address)[0] }
  scope :who_has_email, -> (email) { where("email = ?", email).pluck(:first_name, :last_name).flatten }

  def load_trainer_skills
    self.exercises.pluck(:id)
  end
end
