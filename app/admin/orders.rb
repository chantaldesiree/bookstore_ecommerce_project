ActiveAdmin.register Order do

   permit_params :sutotal, :gst, :pst, :total, :OrderBook_id


end
