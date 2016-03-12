class User < ActiveRecord::Base
  
  has_secure_password validations: false

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 6 }, :confirmation => true

  has_many :petitions
  has_many :votes, through: :petitions

  
end
