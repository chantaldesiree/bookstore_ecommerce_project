class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def create

    @province = Province.find_by(name: "Manitoba")

    @new_order = Order.find_or_create_by(id: Order.new.id)
    if customer_signed_in?
      @new_order.customer_id = current_customer.id
    else
      @new_order.customer_id = session['customer_id']
    end
    @new_order.save

    cart = session['shopping_cart'];

    cart.each do |k,v|
      product = Book.find_or_create_by(id: k);

      @orderbooks = product.orderbooks.create!(
        order_id: @new_order.id,
        quantity: v,
        order_price: product.price,
        total: product.price * v,
      )
    end

    @new_order.paid = true

    session['shopping_cart'] = {}
  end

  def index
    @orders = Order.where("customer_id == ?", current_customer.id).page(params[:page]).per(21)

    add_breadcrumbs("Orders")
  end

  def show
    @order = Order.find(params[:id])

    add_breadcrumbs("Orders", orders_path)
    add_breadcrumbs(@order.id)
  end
end
