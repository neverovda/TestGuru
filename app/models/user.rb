class User < ApplicationRecord
  
  def test_by_level(level)
    Test.joins(:test_passages).where(test_passages: {user_id: self.id}, level: level)
  end
    
end
