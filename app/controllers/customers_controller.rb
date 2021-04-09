class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @orders = Order.where("customer_id == ?", current_customer.id)

    add_breadcrumbs("Customer")
    add_breadcrumbs("#{@customer.first_name} #{@customer.last_name}")
  end
end
