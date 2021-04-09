class RemoveProvinceFromCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :province
  end
end
