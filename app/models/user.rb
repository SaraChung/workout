class User < ActiveRecord::Base
  include CustomField
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :address
  after_validation :geocode

  has_many :sessions
  has_many :trainers, through: :sessions
  has_many :reviews

  has_one :profiles_user, dependent: :destroy
  
  scope :where_is, -> (email) { where("email = ?", email).pluck(:address)[0] }
  scope :who_is, -> (email) { where("email = ?", email).pluck(:first_name, :last_name).flatten }

  before_validation do
    self.password = self.phone_number
  end
end
