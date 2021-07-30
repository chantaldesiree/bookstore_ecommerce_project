class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  has_many :authors, through: :books

  def genre_name
    return self.name
  end
end