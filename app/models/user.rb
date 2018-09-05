class User < ApplicationRecord

  has_many :tests
  has_many :test_passages
  
  def test_by_level(level)
    Test.joins(:test_passages).where(test_passages: {user_id: self.id}, level: level)    
  end
    
end
