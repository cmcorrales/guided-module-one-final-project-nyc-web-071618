require_relative '../config/environment.rb'
require 'pry'

def welcome
  puts "Welcome to The New York Times Best Sellers! Search through our database for an author or book."
end

def author_search(author_name)
  titles_by_author = Book.get_all_titles_by_author(author_name) #PUTS OUT TITLES with extra
  if titles_by_author == []
    puts "Looks like your author didn't make the list yet :( "
  else
    author_book_title = titles_by_author[0]
    puts "#{author_name} has written #{author_book_title}!"
    author_book_search(author_book_title)
  end
end

def author_book_search(author_book)
  puts "Would you like to learn more about this book? (Y/n)"
  input = gets.chomp
  if input == "n"
    puts "Thanks for stopping by! Goodbye."
  else
    book_search(author_book)
  end
end

def book_search(book_title)
  if Book.get_book_instance(book_title) != nil
    author = Book.get_author_from_title(book_title)
    weeks = Book.get_weeks_on_list_from_title(book_title)
    date = Book.get_published_date_from_title(book_title)
    book = Book.find_by(title: book_title)
    publisher = Book.get_publishing_house(book_title)
    # if book == nil
    #   puts "Looks like your book didn't make the list :( "
    if weeks !=nil and weeks != 0 and date !=nil
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's for #{weeks} weeks!" 
      puts "It was published by #{publisher} on #{date}."
    elsif weeks == nil and date == nil
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's list!"
      puts "It was published by #{publisher}."
    elsif weeks == 0 and date == nil
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's list!"
      puts "It was published by #{publisher}."
    elsif date !=nil
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's"
      puts "It was published by #{publisher} on #{date}."
    elsif weeks !=nil
      puts "#{book_title} by #{author} made it on the New York Times Best Seller's list for #{weeks} weeks!"
      puts "It was published by #{publisher}."
    else
      puts "Looks like your book didn't make it on the list :("
    end
  else
    puts "Looks like your book didn't make it on the list :("
  end
  search_again
end

def search_again
  puts "Would you like to do another search? (Y/n)"
  input = gets.chomp
  if input == "n"
    puts "Thanks for stopping by! Goodbye."
  else
    main_program
  end
end

def main_program
  puts "Would you like to search for an author or a book? Tell us which one."
  input = gets.chomp.downcase
  if input == 'author' #<<<< need to create an else statement for when author DNE
    puts "Enter the name of the author"
    author_name = gets.chomp #HACKER CAPITALIZE GIRLBOSS DOESNT WORK
    author_search(author_name)
  elsif input == 'book'
    puts "Enter the title of a book" #UNFINISHED ELSE
    book_title = gets.chomp
    book_search(book_title)
  else
    puts "Please make sure you write 'author' or 'book'".
    main_program
  end
end

welcome
main_program
