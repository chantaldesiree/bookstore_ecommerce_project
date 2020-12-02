class CreateOrderBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :order_books do |t|
      t.integer :quantity
      t.decimal :price
      t.references :Order, null: false, foreign_key: true
      t.references :Book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
