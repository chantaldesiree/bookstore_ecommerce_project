class Year < ApplicationRecord
  has_many :books

  def self.ordered_by_books
    self.select("years.*")
        .select("COUNT(years.id) as book_count")
        .left_joins(:books)
        .group("years.id")
        .order("book_count DESC")
    end
end