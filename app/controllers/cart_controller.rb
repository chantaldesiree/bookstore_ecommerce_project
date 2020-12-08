class CartController < ApplicationController
  def index

  add_breadcrumbs("Shopping Cart")
  end

  def create
    #add params[:id]
    #logger.debug(params[:id])
    id = params[:id].to_i
    book = Book.find(id)
    session[:shopping_cart].has_key?(id.to_s) ? hash = {id => session[:shopping_cart][id.to_s] += 1} : hash = {id => 1}
    session[:shopping_cart].merge!(hash)
    flash[:notice] = "#{book.title} was added to the cart"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    id = params[:id].to_i
    book = Book.find(id)
    session[:shopping_cart].has_key?(id.to_s) ? session[:shopping_cart][id.to_s] > 0 ? session[:shopping_cart][id.to_s] -= 1 : "" : ""
    session[:shopping_cart].has_key?(id.to_s) ? session[:shopping_cart][id.to_s] == 0 ? session[:shopping_cart].delete(id.to_s) : "" : ""
    flash[:notice] = "#{book.title} was removed from the cart"
    redirect_back(fallback_location: root_path)
  end
end
