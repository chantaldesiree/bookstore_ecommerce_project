class GenresController < ApplicationController
  def index
    @genres = Genre.all.page(params[:page]).per(21)

    add_breadcrumbs("Genres")
  end

  def show
    @genre = Genre.find(params[:id])

    add_breadcrumbs("Genres", genres_path)
    add_breadcrumbs(@genre.name)
  end
end
