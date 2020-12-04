class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  accepts_nested_attributes_for :genres, allow_destroy: true


  has_one_attached :image

  validates :title, :isbn, presence: true
  validates :price, presence: true, numericality: true
  validates :rating, presence: true, numericality: true
end