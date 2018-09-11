class Answer < ApplicationRecord

  belongs_to :question

  scope :only_correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_amount_answers, on: :create

  def validate_amount_answers
    return if question.answers.length < 4  
    errors.add(:answers, 'Amount of ansers to question sholud be from 1 to 4')
  end

end
