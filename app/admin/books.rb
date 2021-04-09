ActiveAdmin.register Book do

   permit_params :title, :isbn, :published_year, :description, :rating, :price, :cover_art, :on_sale, :sale_price, :author_id, :year_id, :genre_id, book_genres_attributes: [:id, :book_id, :genre_id, :_destroy]

   form do |f|
    f.inputs do
      f.has_many :book_genres, allow_destroy: true do |n_f|
        n_f.input :genre
      end
    end

    f.inputs
    f.actions

   end
end
