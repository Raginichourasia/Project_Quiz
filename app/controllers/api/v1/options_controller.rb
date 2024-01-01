class Api::V1::OptionsController < ApplicationController
  before_action :authenticate_user!

	def index
		@question = Question.find(params[:question_id])
		@option = @question.options.all
		render json: @option, status: :ok
	end

	def show
		@option = Option.find(params[:id])
		render json: @option, status: :ok
	end

  def create
    @question = Question.find(params[:question_id])
		@option = Option.new(option_params)
		if @option.save
			render json: @option, status: :created 
		else
			render json: @option.errors, status: :unprocessable_entity
		end
  end

	private 

	def option_params
    params.require(:option).permit(:option, :is_correct,:question_id)
	end
end