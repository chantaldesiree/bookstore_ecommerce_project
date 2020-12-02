class ChangeGenresIdToGenreId < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :genres_id, :genre_id
  end
end
