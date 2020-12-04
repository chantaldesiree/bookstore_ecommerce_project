class Genre < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :authors, through: :books

end