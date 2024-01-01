class Api::V1::ResponsesController < ApplicationController
  before_action :authenticate_user!

	def index
		#@question = Question.find(params[:question_id])
		#@option = Option.find(params[:option_id])
		@assessment = Assessment.find(params[:assessment_id])
		@response = current_user.responses.all
		render json: @response, status: :ok
	end

	def create
		@question = Question.find(params[:question_id])
		@option = Option.find(params[:option_id])
		@response = current_user.responses.new(response_params)
    if @response.save
			render json: @response, status: :ok
		else
			render json: @response.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def response_params   
		params.require(:response).permit(:option_id, :question_id)
	end
end

