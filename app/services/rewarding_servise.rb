class RewardingServise
 
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
    @test_passage = test_passage
  end
  
  def call
    badges = []
    Badge.all.each do |badge|
      name_rule = ('reward_by_' + badge.rule_type)
      badges.push(badge) if send(name_rule, badge.rule_value ) 
    end
    return badges
  end

  def self.rule_types
    [['с первой удачной попытки', 'first_successful_attempt'],
     ['определенная категория','category'],
     ['определенный уровень','level']].freeze
  end

  private
  
  def reward_by_first_successful_attempt(_param)  
    TestPassage.amount_user_test_attempt(@test) == 1 &&
                                  @test_passage.success? 
  end  
    
  def reward_by_category(category_title)
    category = Category.find_by(title: category_title)
    
    (category == @test.category) &&
    (Test.amount_by_category(category) == 
     TestPassage.amount_user_success_by_category(@user, category))
  end

  def reward_by_level(level)
    (level.to_i == @test.level) &&
    (Test.amount_by_level(@test.level) == 
     TestPassage.amount_user_success_by_level(@user, @test.level))
  end
  
end
