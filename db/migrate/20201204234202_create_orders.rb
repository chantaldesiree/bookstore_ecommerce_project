class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total
      t.decimal :gst
      t.decimal :pst
      t.decimal :hst

      t.timestamps
    end
  end
end
