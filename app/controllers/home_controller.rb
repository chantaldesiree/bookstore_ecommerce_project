class HomeController < ApplicationController
  def index
    @book_top_rated = Book.includes(:author).order("rating DESC").page(params[:page]).per(21)

    @book_new = Book.includes(:author).where("created_at >= ?", Time.now-3.days).order("created_at ASC").page(params[:page]).per(3)

    @book_on_sale = Book.includes(:author).where(:on_sale => true).order("sale_price ASC").page(params[:page]).per(4)
  end
end
