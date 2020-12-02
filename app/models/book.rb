class Book < ApplicationRecord
  belongs_to :Author
  belongs_to :OrderBook
end
