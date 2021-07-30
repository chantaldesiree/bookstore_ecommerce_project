class AuthorsController < ApplicationController
  def index
    @authors = Author.ordered_by_books.page(params[:page]).per(21)

    add_breadcrumbs("Authors")
  end

  def show
    @author = Author.find(params[:id])

    add_breadcrumbs("Authors", authors_path)
    add_breadcrumbs(@author.name)
  end
end
