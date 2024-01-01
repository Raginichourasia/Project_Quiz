class ChangeNameInPictures < ActiveRecord::Migration[7.0]
  def change
    change_column :pictures, :type, :name
  end
end
