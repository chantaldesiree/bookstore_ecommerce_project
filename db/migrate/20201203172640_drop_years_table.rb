class DropYearsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :years
  end
end