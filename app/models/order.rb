class Order < ApplicationRecord
  before_create :set_subtotal, :set_order_gst, :set_order_pst, :set_order_hst, :set_total
  has_many :orderbooks
  has_many :books, through: :orderbooks

  belongs_to :customer
  has_many :provinces, through: :customers

  def subtotal
    orderbooks.collect{|orderbook| orderbook.valid? ? orderbook.order_price*orderbook.quantity : 0}.sum
  end

  def total
    orderbooks.collect{|orderbook| orderbook.valid? ? orderbook.order_price*orderbook.quantity : 0}.sum + (order_gst + order_pst + order_hst)
  end

  def get_province
    customer = Customer.find_by(id: customer_id)
    province = Province.find_by(id: customer.province_id)
  end

  def order_gst
    subtotal * (get_province.gst)
  end

  def order_pst
    subtotal * (get_province.pst)
  end

  def order_hst
    subtotal * (get_province.hst)
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_order_gst
    self[:gst] = order_gst
  end

  def set_order_pst
    self[:pst] = order_pst
  end

  def set_order_hst
    self[:hst] = order_hst
  end

  def set_total
    self[:total] = total
  end
end
