class QuestionsController < ApplicationController
  
  before_action :find_test, only: %i[index new create]
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
    @test.questions.build(question_params).save!
    render plain: 'Question created'    
  end

  def destroy
    @question.destroy!
    render plain: 'Question deleted'  
  end

  private

  def question_params 
    { test_id: @test.id,
      body: params[:question][:body] }
  end  

  def find_test
    @test = Test.find(params[:test_id])
  end  

  def find_question
    @question = Question.find(params[:id])    
  end

  def rescue_with_question_not_found(exception)
    render plain: "#{exception.model} whis id #{exception.id} not found."  
  end
  
end
