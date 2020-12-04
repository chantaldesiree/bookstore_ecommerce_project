class AddProvincesReferenceInCustomer < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :province, index: true
  end
end