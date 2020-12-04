ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :isbn, :published_year, :description, :rating, :price, :cover_art, :on_sale, :sale_price, :author_id, :year_id, :genre_id

   form do |f|
    f.inputs do
      f.input :genre_id, :as => :select, :collection => Genre.all.map{|u| ["#{u.name}", u.id]}, include_blank: false, include_hidden: false
    end

    f.inputs

    f.actions
   end
  # or
  #
  # permit_params do
  #   permitted = [:title, :isbn, :published_year, :description, :rating, :price, :cover_art, :on_sale, :sale_price, :author_id, :genre_id, :year_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end