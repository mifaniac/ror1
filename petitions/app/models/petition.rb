class Petition < ActiveRecord::Base
  EXPIRATION_TIME = 30
  MIN_VOTES = 100

  belongs_to :user
  has_many :votes, dependent: :destroy
  scope :expired, -> { where("created_at <= ?" , EXPIRATION_TIME.days.ago)}
  scope :active, -> { where("created_at > ?" , EXPIRATION_TIME.days.ago)}

  def expired?
    created_at <= EXPIRATION_TIME.days.ago
  end
  
end
