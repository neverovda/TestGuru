class Question < ApplicationRecord
  
  belongs_to :test
  has_many :answers, dependent: :destroy
  
  validates :body, presence: true

  validate :validate_amt_answers

  def validate_amt_answers
    return if (1..4).include? answers.length  
    errors.add(:answers, 'Number of ansers sholud be from 1 to 4')
  end

end
