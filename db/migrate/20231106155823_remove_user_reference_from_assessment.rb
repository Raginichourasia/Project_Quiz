class RemoveUserReferenceFromAssessment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :assessments, :user, foreign_key: true
  end
end
