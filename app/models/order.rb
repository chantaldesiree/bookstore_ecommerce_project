class Order < ApplicationRecord
  has_many :order_books
  before_save :set_subtotal

  def subtotal
    order_books.collect {|order_book| order_book.valid? ? order_book.current_price * order_book.quantity : 0}
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  #set the customer to order
  #use the customer province to find the tax.
  #def set_gst
  #  province = Province.find_by()
  #  self[:gst] =
  #end

end
