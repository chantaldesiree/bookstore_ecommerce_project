class RemoveCustomerInProvinces < ActiveRecord::Migration[6.0]
  def change
    remove_index :provinces, :customer_id
    remove_column :provinces, :customer_id
  end
end
