class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :initialize_session, :set_breadcrumbs
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

  def initialize_session
    #this will be where we initialize our shopping cart.
    session[:shopping_cart] ||= {} #hash of product id
  end
end
