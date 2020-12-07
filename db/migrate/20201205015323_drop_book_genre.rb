class DropBookGenre < ActiveRecord::Migration[6.0]
  def change
    drop_table :bookgenres
  end
end
