class Trainer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :address
  has_many :exercises_trainers
  has_many :exercises, through: :exercises_trainers
  after_validation :geocode
  validates :email, uniqueness: true, presence: true  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  def load_trainer_skills
    self.exercises.pluck(:id)
  end

end
