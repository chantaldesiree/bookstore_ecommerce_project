class AddYearIndexToBooks < ActiveRecord::Migration[6.0]
    add_column :books, :year_id, :integer
    add_index :books, :year_id
end
