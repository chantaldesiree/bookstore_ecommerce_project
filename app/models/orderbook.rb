class Orderbook < ApplicationRecord
  belongs_to :order
  belongs_to :book


  def current_price
    if persisted?
      self[:order_price]
    else
      book.price
    end
  end

  def total
    order_price * quantity
  end

  def set_order_price
    self[:order_price] = order_price
  end

  def set_total
    self[:total] = total * quantity
  end

end
