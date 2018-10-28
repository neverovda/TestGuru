class Badge < ApplicationRecord
  
  RULE_TYPES = ['first_successful_attempt', 'category', 'level'].freeze
  
  belongs_to :author, class_name: 'User'
  
  has_many :personal_badges, dependent: :destroy
  has_many :users, through: :personal_badges

  before_validation :check_imagine

  def check_imagine
    self.image_path = '/badge.jpg' if image_path.blank? 
  end

end
