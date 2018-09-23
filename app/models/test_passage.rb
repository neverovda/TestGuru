class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_next_question, on: :update


  def completed?
    current_question.nil?
  end  

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
   
    save!
  end

  def totals
    percanteges = (correct_questions.to_f/test.questions.size * 100).round
    { percanteges: percanteges, success: (percanteges >= 85 ? true : false) }
  end

  def progress
    all_questions = test.questions.size
    { current: all_questions - unanswered_questions.size,
      total: all_questions }    
  end    

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    return false if answers_ids.nil?
    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.only_correct
  end

  def before_validation_next_question
    self.current_question = unanswered_questions.first
  end

  def unanswered_questions
    test.questions.order(:id).where('id > ?', current_question.id)  
  end  

end
