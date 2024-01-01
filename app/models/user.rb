class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, 
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :assessments
  has_many :responses
  has_many :performances
  enum role: {candidate: 0, admin: 1}

  
  def response_for_question(question)
    responses.find_by(question: question)
  end

  def performance_for_assessment(assessment)
    performances.find_or_initialize_by(assessment: assessment)
  end
end
