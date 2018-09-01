class User < ApplicationRecord
  def list_test(level)
    all_user_tests = UserProfile.where(user_id: self.id)
    return if all_user_tests.empty?
    all_user_tests.map!(&:test_id)
    Test.where(id: all_user_tests, level: level)
  end  
end
