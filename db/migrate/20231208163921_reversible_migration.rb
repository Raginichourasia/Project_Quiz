class ReversibleMigration < ActiveRecord::Migration[7.0]
    def up 
     change_column :assessments, :title, :string
    end

    def down 
     change_column :assessments, :title, :integer
    end
end
