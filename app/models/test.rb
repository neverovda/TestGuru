class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passage 
  def self.by_category(category)
    select(:title).joins(:category).where(categories: {title: category}).order(title: :desc)    
  end
end
