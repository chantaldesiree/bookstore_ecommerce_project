class CreateBookgenres < ActiveRecord::Migration[6.0]
  def change
    create_table :bookgenres do |t|
      t.references :book, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
