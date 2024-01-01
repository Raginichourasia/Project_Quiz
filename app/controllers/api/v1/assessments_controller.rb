class Api::V1::AssessmentsController < ApplicationController
	before_action :set_assessment, only: [:show, :destroy,:shankar]
	before_action :authenticate_user!
  
	def index 
		@assessment = Assessment.all
		render json: @assessment
	end

	def show 
		render json: @assessment
	end

	def create
		@assessment = current_user.assessments.new(assessment_params)
		if @assessment.save
			render json: @assessment, status: :created
		else
			render json: @assessment.errors, status: :unprocessable_entity
	  end
	end

	def destroy
		@assessment.destroy
		render json: { status: 'deleted successfully'}
	end

	private

	def set_assessment
		@assessment = current_user.assessments.find(params[:id])
	end

	def assessment_params
		params.require(:assessment).permit(:title, :level)
	end
end