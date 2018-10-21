class Feedback
  include ActiveModel::Model
 
  attr_accessor :title, :body, :email

  validates :title, presence: true
  validates :body, presence: true
  validates :email, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end    
  end

  private

  def persist!
    FeedbacksMailer.send_feedback(title, body, email).deliver_now
  end

end
