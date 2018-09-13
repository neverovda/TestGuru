class QuestionsController < ApplicationController
  
  before_action :find_test, only: :index
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions 
  end

  def show
    @question.body
    render json: @question
  end

  def new
  end

  def create
    question = Question.new
    question.test_id = params[:question][:test_id].to_i
    question.body = params[:question][:body]
    question.save!

    render plain: 'Question created'    
  end

  def destroy
    @question.destroy!

    render plain: 'Question deleted'  
  end

  private

  def find_test
    @test = Test.find_by_id(params[:test_id])
  end  

  def find_question
    @question = Question.find(params[:id])    
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'  
  end
  
end
