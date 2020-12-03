class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre


  has_one_attached :image

  validates :title, :isbn, :published_year, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, presence: true, numericality: true
end