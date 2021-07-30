class RemoveOrderIdFromOrderBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :orderbooks, :order_id
  end
end
