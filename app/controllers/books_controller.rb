class BooksController < ApplicationController
  def index
    @book_top_rated = Book.includes(:author).order("rating DESC").page(params[:page]).per(21)

    @book_new = Book.includes(:author).where("created_at >= ?", Time.now - 3.days).order("created_at ASC").page(params[:page]).per(3)

    @book_on_sale = Book.includes(:author).where(:on_sale => true).order("sale_price ASC").page(params[:page]).per(4)


    @books = Book.includes(:author).order("title ASC").page(params[:page]).per(21)
    add_breadcrumbs("Books")
  end

  def show
    @book = Book.find(params[:id])

    add_breadcrumbs("Books", books_path)
    add_breadcrumbs(@book.title)
  end

  def search
    @book_genres = Genre.all
    wildcard_search = "%#{params[:keywords]}%"
    category_search = "#{params[:category]}"

    @genre = Genre.find_by_name(category_search)

    @genre ? @count = Book.where('genre_id = ?', @genre.id).where("title LIKE ?", wildcard_search.downcase()) : @count = Book.where("title LIKE ?", wildcard_search.downcase())
    @genre ? @books = Book.where('genre_id = ?', @genre.id).where("title LIKE ?", wildcard_search.downcase()).page(params[:page]).per(21) : @books = Book.where("title LIKE ?", wildcard_search.downcase()).page(params[:page]).per(21)

    add_breadcrumbs("Books", books_path)
    add_breadcrumbs("Search")
  end
end
