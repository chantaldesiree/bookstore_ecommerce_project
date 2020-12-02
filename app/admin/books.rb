ActiveAdmin.register Book do

  permit_params :title, :isbn, :published_year, :description, :rating, :price, :cover_art, :genre, :on_sale, :sale_price, :Author_id, :OrderBook_id

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize_to_limit: [600, 600])) : ""
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
