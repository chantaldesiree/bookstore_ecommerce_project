class AddHstgstpstToProvinces < ActiveRecord::Migration[6.0]
  def change
    remove_column :provinces, :tax_rate
    add_column :provinces, :gst, :decimal
    add_column :provinces, :pst, :decimal
    add_column :provinces, :hst, :decimal
  end
end
