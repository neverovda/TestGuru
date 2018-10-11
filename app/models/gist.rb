class Gist < ApplicationRecord

  belongs_to :user
  belongs_to :question
  
  validates :question, presence: true
  validates :user, presence: true
  validates :gist_hash, presence: true

end
