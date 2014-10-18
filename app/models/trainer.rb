class Trainer < ActiveRecord::Base
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
  scope :skill, -> (id) { relations.where("exercises.id = ?", id).pluck(:id).uniq }
  scope :has_session, -> (start_date, end_date) { relations.where("sessions.from_when >= ? AND sessions.to_when <= ?",start_date, end_date).pluck(:id).uniq }
  scope :closest_trainer, -> (user_address) { near(user_address, 10, units: :km) }
  scope :available, -> (id, start_date, end_date) { where("id IN (#{(skill(id) - has_session(start_date, end_date)).join(',')})") }

  def load_trainer_skills
    self.exercises.pluck(:id)
  end
end
