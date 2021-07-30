# ECOMMERCE BOOKSTORE

This project is an ecommerce website for a bookstore.
You have the ability to search through the books alphabetically, by date added or by rating.
Books can be added and removed from the users cart.
Once finished you can checkout using the Stripe service.

Created using Ruby version 2.7.1 and Rails 6.1.1.

The bookstore's database is created using a seed file. 'seed.rb' in the db folder.
This file reads through a .csv of the top 100 books on goodreads and populates them into the database.
It is initialized using the 'rails db:seed' command.

An ActiveAdmin dashboard allows the webmaster to add/remove/edit all products in the database and filter them into genres.
This dashboard also allows them to edit their 'Contact' and 'About Us' pages with no programming knowledge required.
