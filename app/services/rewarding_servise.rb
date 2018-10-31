class RewardingServise
 
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @test_passage = test_passage
  end
  
  def call
    Badge.select do |badge|
      name_rule = "reward_by_#{badge.rule_type}?"   
      send(name_rule, badge.rule_value ) 
    end    
  end

  private
  
  def reward_by_first_successful_attempt?(_param)
    @test_passage.success? &&  
      TestPassage.where(test: @test).count == 1
  end  
    
  def reward_by_category?(category_title)
    category = Category.find_by(title: category_title)
    
    category == @test.category &&
    Test.where(category: category).count == 
      amount_user_success_by_category(@user, category)    
  end

  def reward_by_level?(level)
    level.to_i == @test.level &&
    Test.where(level: @test.level).count == 
      amount_user_success_by_level(@user, @test.level)
  end
  
  def amount_user_success_by_category(user, category)
    user.test_passages.by_category(category).where(success: true).
         group(:test).count.keys.size
  end

  def amount_user_success_by_level(user, level)
    user.test_passages.by_level(level).where(success: true).
         group(:test).count.keys.size
  end
  
end
