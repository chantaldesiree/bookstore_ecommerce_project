class AddReferenceToOrderInOrderBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :orderbooks, :order, index: true, foreign_key: true
  end
end
