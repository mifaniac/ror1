class Vote < ActiveRecord::Base

  belongs_to :petition
  belongs_to :user

  validates :user_id, uniqueness: { scope: :petition_id }

end
