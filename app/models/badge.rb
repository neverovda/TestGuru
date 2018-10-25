class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'
  
  has_many :personal_badges, dependent: :destroy
  has_many :users, through: :personal_badges

  validate :only_one_rule

  def only_one_rule
    counter = 0 
    rules = [one_successful_attempt, category_id, (level && level != 0)]   
    rules.each {|rule| counter += 1 if rule }
    errors.add(:count_rules, "there must be one rule") unless counter == 1 
  end

  def self.rewarding(user, test)
    all.each do |badge|
      badge.users.push(user) if badge.reward?(user, test)
    end
  end
  
  def reward?(user, test)

    if one_successful_attempt  
      return TestPassage.amount_user_test_attempt(test) == 1 &&
             TestPassage.success?(test) 
    end  
    
    category = Category.find_by_id(category_id)
    if category && (test.category == category)
      return Test.amount_by_category(category) == 
             TestPassage.amount_user_success_by_category(user, category)
    end

    if level && (test.level == level)
      return Test.amount_by_level(level) == 
             TestPassage.amount_user_success_by_level(user, level)
    end

  end   

end
