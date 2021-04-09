class PagesController < ApplicationController
  def permalink
    @page = Page.find_by(permalink: params[:permalink])

    add_breadcrumbs(@page.title)
  end
end
