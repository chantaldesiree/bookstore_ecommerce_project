class YearsController < ApplicationController
  def index
    @years = Year.all.page(params[:page]).per(21)

    add_breadcrumbs("Years")
  end

  def show
    @year = Year.find(params[:id])

    add_breadcrumbs("Years", years_path)
    add_breadcrumbs(@year.date)
  end
end
