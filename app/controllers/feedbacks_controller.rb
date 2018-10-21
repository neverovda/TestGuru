class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(title: feedback_params[:title],
                             body: feedback_params[:body],
                             email: current_user.email) 
    
    if @feedback.save
      
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
