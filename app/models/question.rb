class Question < ApplicationRecord
  has_and_belongs_to_many :assessments
  has_many :options
  has_many :responses
end
