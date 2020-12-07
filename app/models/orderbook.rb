class Orderbook < ApplicationRecord
  belongs_to :order
  belongs_to :book


  def current_price
    if persisted?
      self[:current_price]
    else
      book.price
    end
  end

  def total
    unit_price * quantity
  end

  def set_current_price
    self[:current_price] = current_price
  end

  def set_total
    self[:total] = total * quantity
  end

end
