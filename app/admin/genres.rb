ActiveAdmin.register Genre do

  permit_params :name, bookgenres: [:id, :book_id, :genre_id, :_destroy]

  index do
    selectable_column
    column :id
    column :name
    column :book do |buks|
      buks.books.map { |b| b.title }.join(", ").html_safe
    end
    column :created_at
    column :updated_at
    actions
  end


end