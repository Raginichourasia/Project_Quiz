class AddReferencesToPictures < ActiveRecord::Migration[7.0]
  def change
    add_reference :pictures, :employee, foreign_key: true
    add_reference :pictures, :product, foreign_key: true

  end
end
