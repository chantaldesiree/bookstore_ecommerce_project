require "faker"
require "csv"

Book.delete_all
Author.delete_all
AdminUser.delete_all

filename = Rails.root.join("db/books.csv")

puts "Loading Books from CSV file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: "utf-8")

books.each do |b|

 authors = Author.find_or_create_by(name: b["authors"])
 genres = Genre.find_or_create_by(name: b['genre'])

 if authors&.valid?
  authors.books.create(
    title: b['original_title'],
    published_year: b['original_publication_year'],
    description: Faker::Books::Lovecraft.paragraphs,
    isbn: b['isbn'],
    price: Faker::Number.decimal(l_digits: rand(1..2), r_digits: 2),
    rating: b['average_rating'],
    cover_art: b['image_url'],
    on_sale: Faker::Boolean.boolean,
    genre_id: genres["id"]

  )

end
next
end

saved_books = Book.all

saved_books.each do |b|
  b.sale_price = b.price * 0.9
  b.save
end

puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
