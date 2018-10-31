class Badge < ApplicationRecord
  
  RULE_TYPES = %w[first_successful_attempt category level]
  
  belongs_to :author, class_name: 'User'
  
  has_many :personal_badges, dependent: :destroy
  has_many :users, through: :personal_badges

  before_validation :set_default_image

  def set_default_image
    self.image_path = '/badge.jpg' if image_path.blank? 
  end

end
