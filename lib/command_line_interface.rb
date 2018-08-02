require_relative '../config/environment.rb'
require 'pry'
# 
# def welcome
#   puts "Welcome to The New York Times Best Sellers!"
# end
#
# def get_book_from_user
#   puts "Would you like to search for an author or a book?"
#   input = gets.chomp.downcase
#   if input == 'author' #<<<< need to create an else statement for when author DNE
#     puts "Enter the name of the author"
#     author_name = gets.chomp #HACKER CAPITALIZE GIRLBOSS DOESNT WORK
#     puts Book.get_all_titles_by_author(author_name) #PUTS OUT TITLES with extra
#   else
#     puts "Enter the title of a book" #UNFINISHED ELSE
#     book_title = gets.chomp
#     Book.get_description(book_title)
#   end
# end
#
# welcome
# get_book_from_user
