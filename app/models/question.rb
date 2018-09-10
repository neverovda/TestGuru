class Question < ApplicationRecord
  
  belongs_to :test
  has_many :answers, dependent: :destroy
  
  validates :body, presence: true

  def answer_belongs? (answer)
    answers.include? answer
  end  
  
end
