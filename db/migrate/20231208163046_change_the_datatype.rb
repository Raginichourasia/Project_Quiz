class ChangeTheDatatype < ActiveRecord::Migration[7.0]
  def change
    change_column :assessments, :level, :string
  end
end
