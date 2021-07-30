class Book < ApplicationRecord
  belongs_to :author

  has_many :book_genres
  has_many :genres, through: :book_genres
  accepts_nested_attributes_for :book_genres, allow_destroy: true

  has_many :orderbooks
  has_many :orders, through: :orderbooks

  has_one_attached :image

  validates :title, :isbn, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, presence: true, numericality: true

  def genres_list
    genres.map(&:name).join(", ")
    genres.map { |genre| genre.name }.join(", ")
  end
end