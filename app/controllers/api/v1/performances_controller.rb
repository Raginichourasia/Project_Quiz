class Api::V1::PerformancesController < ApplicationController
  before_action :authenticate_user!

	def create 
		assessment = Assessment.find(params[:assessment_id])
		user = current_user
		user_performance = user.performances.new(assessment: assessment)
		if user_performance.save 
			render json: { message: 'performance created successfully', performance: user_performance }, status: :created
		else
			render json: { errors: user_performance.errors.full_messages }, status: :unprocessible_entity
		end
	end

	def calculate_score
		user = current_user
		assessment = Assessment.find(params[:assessment_id])

		user_score = calculate_user_score(user, assessment)

		performance  = user.performance_for_assessment(assessment)
		performance.update(score: user_score, assessment: assessment)

		render json: { score: user_score }
	end

	private 

	def calculate_user_score(user, assessment)
	  questions = assessment.questions.includes(:options, :responses)

		correct_response_count = 0

		questions.each do |question|
			user_response = user.response_for_question(question)

      if user_response&.option&.is_correct?
				correct_response_count +=	1
			end
		end
		total_questions = questions.size
		calculate_percentage(correct_response_count, total_questions)
  end

	def calculate_percentage(correct_count, total_count)
    return 0 if total_count.zero?

		(correct_count.to_f / total_count) * 100
	end
	
end