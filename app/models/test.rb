class Test < ApplicationRecord
  
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  
  def self.by_category(category)
    joins(:category).where(categories: {title: category}).
                     order(title: :desc).pluck(:title)                   
  end

end
