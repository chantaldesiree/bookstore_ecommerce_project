class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])

    add_breadcrumbs("Customer")
    add_breadcrumbs("#{@customer.first_name} #{@customer.last_name}")
  end
end
