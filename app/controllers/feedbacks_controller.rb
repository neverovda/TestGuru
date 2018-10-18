class FeedbacksController < ApplicationController

  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params) 
    
    if @feedback.save
      FeedbacksMailer.send_feedback(feedback_params, 
                                    current_user.email).deliver_now
      redirect_to tests_path, notice: t('.success')      
    else
      render :new
    end


  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
