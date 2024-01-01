class Createjointableassessmentsquestions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :questions, :assessments, table_name: :questions_assessments do |t|
      t.index :question_id
      t.index :assessment_id
    end 
  end
end
