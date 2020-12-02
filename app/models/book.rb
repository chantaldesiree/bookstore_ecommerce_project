class Book < ApplicationRecord
  belongs_to :Author
  belongs_to :OrderBook

  has_one_attached :image
end
