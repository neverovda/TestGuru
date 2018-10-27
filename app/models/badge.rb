class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'
  
  has_many :personal_badges, dependent: :destroy
  has_many :users, through: :personal_badges

  before_validation :check_imagine

  def check_imagine
    self.img_direction = '/badge.jpg' if img_direction.blank? 
  end
  
end
