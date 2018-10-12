class Gist < ApplicationRecord

  belongs_to :user
  belongs_to :question
  
  validates :gist_hash, presence: true

end
