class User < ApplicationRecord

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id,
           dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  def test_by_level(level)
    tests.where(level: level)    
  end
    
end
