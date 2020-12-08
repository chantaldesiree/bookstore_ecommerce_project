class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :initialize_session, :set_breadcrumbs, :create_customer
  helper_method :cart

  def add_breadcrumbs(label, path = nil)
    @breadcrumbs << {
      label: label,
      path:  path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  private

  def create_customer
    if customer_signed_in?
      Customer.find_or_create_by(email: current_customer.email)
    else
      customer = Customer.find_or_create_by(email: "guest@turnthepage.com")
      session[:customer_id] = customer.id
    end
  end

  def initialize_session
    #this will be where we initialize our shopping cart.
    session[:shopping_cart] ||= {} #hash of product id
  end
end
