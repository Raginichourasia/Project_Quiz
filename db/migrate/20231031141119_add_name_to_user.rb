class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :user_roles, :name, :string
    add_column :users_roles, :role, :integer, default: 0 
  end
end
