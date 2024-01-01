class RemoveColumnFromPictures < ActiveRecord::Migration[7.0]
  def change
    remove_column :pictures, :product_id, :integer 
    remove_column :pictures, :employee_id, :integer 
  end
end
