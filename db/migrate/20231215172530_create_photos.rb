class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :imagable_id
      t.string :imagable_type

      t.timestamps
    end
  end
end
