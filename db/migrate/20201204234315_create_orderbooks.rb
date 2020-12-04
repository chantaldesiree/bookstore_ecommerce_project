class CreateOrderbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :orderbooks do |t|
      t.integer :quantity
      t.integer :book_id
      t.integer :order_id
      t.decimal :total
      t.decimal :order_price

      t.timestamps
    end
  end
end
