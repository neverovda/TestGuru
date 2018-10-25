class Test < ApplicationRecord
  
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  
  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category, -> (category) { where(category: category) }
    
  def self.amount_by_category(category)
    by_category(category).count
  end

  def self.amount_by_level(level)
    by_level(level).count
  end

end
