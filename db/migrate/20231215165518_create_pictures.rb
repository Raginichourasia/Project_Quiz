class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :type
      t.integer :imagable_id
      t.string :imagable_type

      t.timestamps
    end
  end
end
