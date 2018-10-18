class FeedbacksMailer < ApplicationMailer

  def send_feedback(args, user_email)
    
    @text_title = args[:title]
    @text_body = args[:body]

    mail to: 'dmi.neverov@gmail.com', subject: "Отзыв от #{user_email}"
  end

end
