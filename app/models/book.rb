class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  belongs_to :years, optional: true


  has_one_attached :image

  validates :title, :isbn, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, presence: true, numericality: true
end