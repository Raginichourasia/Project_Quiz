class Api::V1::QuestionsController < ApplicationController
	before_action :authenticate_user!
  
  def index
    @assessment = Assessment.find(params[:assessment_id])
    @questions = @assessment.questions.all
    render json: @questions, status: :ok
  end 

  def show 
    @question = Question.find(params[:id])
    render json: @question, status: :ok
  end 

  def create
    @assessment = Assessment.find(params[:assessment_id])
    @question = Question.new(question_params)
    if @question.save
			@assessment.questions << @question
			render json: @question, status: :created
		else
			render json: @question.errors, status: :unprocessable_entity
		end
  end

  private 
       
  def question_params
	  params.require(:question).permit(:content)
	end
    
end
