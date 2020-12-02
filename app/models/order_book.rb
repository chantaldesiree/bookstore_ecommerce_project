class OrderBook < ApplicationRecord
  belongs_to :Order
  belongs_to :Book
end
