require_relative '../config/environment.rb'
require 'pry'

def welcome
  puts "Welcome to The New York Times Best Sellers!"
end

def get_book_from_user
  puts "Would you like to search for an author or a book?"
  input = gets.chomp.downcase
    if input == 'author' #<<<< need to create an else statement for when author DNE
      puts "Enter the name of the author"
      author_name = gets.chomp #HACKER CAPITALIZE GIRLBOSS DOESNT WORK
      titles_by_author = Book.get_all_titles_by_author(author_name) #PUTS OUT TITLES with extra
      puts "#{author_name} has written #{titles_by_author[0].titleize}!"
    elsif input == 'book'
      puts "Enter the title of a book" #UNFINISHED ELSE
      book_title = gets.chomp
      author = Book.get_author_from_title(book_title)
      weeks = Book.get_weeks_on_list_from_title(book_title)
      date = Book.get_published_date_from_title(book_title)
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's for #{weeks} weeks! It was published on #{date}."
    else
    get_book_from_user
  end
end

welcome
get_book_from_user
