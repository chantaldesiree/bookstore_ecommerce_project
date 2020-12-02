ActiveAdmin.register OrderBook do

  permit_params :quantity, :price, :Order_id, :Book_id

end
