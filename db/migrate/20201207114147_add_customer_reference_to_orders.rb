class AddCustomerReferenceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :customer, index: true, foreign_key: true
  end

end
