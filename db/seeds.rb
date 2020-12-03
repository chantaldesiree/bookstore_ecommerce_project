require "faker"
require "csv"

Book.delete_all
Author.delete_all
Genre.delete_all
Year.delete_all
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
 genres = Genre.find_or_create_by(name: b['genre'])
 years = Year.find_or_create_by(date: b['original_publication_year'])

 if authors&.valid?
  authors.books.create!(
    title: b['original_title'],
    published_year: years["id"],
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
