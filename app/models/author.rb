class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books

  validates :name, presence: true

    def self.ordered_by_books
    self.select("authors.*")
        .select("COUNT(authors.id) as book_count")
        .left_joins(:books)
        .group("authors.id")
        .order("book_count DESC")
    end
end