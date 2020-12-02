class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :sutotal
      t.decimal :gst
      t.decimal :pst
      t.decimal :total
      t.references :OrderBook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
