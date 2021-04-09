require "faker"
require "csv"

BookGenre.delete_all
Genre.delete_all
Book.delete_all
Author.delete_all
Page.delete_all
Province.delete_all
Orderbook.delete_all
Order.delete_all
AdminUser.delete_all

Page.create(
  title: 'About The Company',
  content: 'Here is some information about the company. Established in 1921, this coming year will be Turn the Pages 100 years in business',
  permalink: 'about_us',
)
Page.create(
  title: 'Contact Us',
  content: 'If you would like to get a hold of us, you can reach us at 1-204-999-9999, or email us at turnthepage@aol.com',
  permalink: 'contact_us',
)


filename = Rails.root.join("db/books.csv")

puts "Loading Books from CSV file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: "utf-8")

books.each do |b|
 authors = Author.find_or_create_by(name: b["authors"])
 genre = Genre.find_or_create_by(name: b['genre'])

  if authors&.valid?
  book = authors.books.create!(
      title: b['original_title'],
      published_year:  b['original_publication_year'],
      description: Faker::Books::Lovecraft.paragraphs,
      isbn: b['isbn'],
      price: Faker::Number.decimal(l_digits: rand(1..2), r_digits: 2),
      rating: b['average_rating'],
      cover_art: b['image_url'],
      on_sale: Faker::Boolean.boolean

    )
  end
  BookGenre.create(book: book, genre: genre)
next
end

saved_books = Book.all

saved_books.each do |b|
  b.sale_price = b.price * 0.9
  b.save
end

puts "Created #{Author.count} authors"
puts "Created #{Book.count} books"
puts "Created #{Genre.count} genres"
puts "Created #{BookGenre.count} bookgenres"


Province.create(
  name: 'Alberta',
  gst: 0.05,
  hst: 0.00,
  pst: 0.00
)
Province.create(
  name: 'British Columbia',
  gst: 0.05,
  hst: 0.00,
  pst: 0.07
)
Province.create(
  name: 'Manitoba',
  gst: 0.05,
  hst: 0.00,
  pst: 0.07
)
Province.create(
  name: 'New Brunswick',
  gst: 0.00,
  hst: 0.15,
  pst: 0.00
)
Province.create(
  name: 'Newfoundland and Labrador',
  gst: 0.00,
  hst: 0.15,
  pst: 0.00
)
Province.create(
  name: 'Nova Scotia',
  gst: 0.00,
  hst: 0.15,
  pst: 0.00
)
Province.create(
  name: 'Northwest Territories',
  gst: 0.05,
  hst: 0.00,
  pst: 0.00
)
Province.create(
  name: 'Nunavut',
  gst: 0.05,
  hst: 0.00,
  pst: 0.00
)
Province.create(
  name: 'Ontario',
  gst: 0.00,
  hst: 0.13,
  pst: 0.00
)
Province.create(
  name: 'Prince Edward Island',
  gst: 0.00,
  hst: 0.15,
  pst: 0.00
)
Province.create(
  name: 'Quebec',
  gst: 0.09975,
  hst: 0.00,
  pst: 0.05
)
Province.create(
  name: 'Saskatchewan',
  gst: 0.05,
  hst: 0.00,
  pst: 0.06
)
Province.create(
  name: 'Yukon',
  gst: 0.05,
  hst: 0.00,
  pst: 0.00
)



AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
