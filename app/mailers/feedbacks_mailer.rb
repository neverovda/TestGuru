class FeedbacksMailer < ApplicationMailer

  def send_feedback(title, body, user_email)
    
    @text_title = title
    @text_body = body

    mail to: 'dmi.neverov@gmail.com', subject: "Отзыв от #{user_email}"
  end

end
