class Book < ActiveRecord::Base
  belongs_to :publishing_house
  belongs_to :author

  def self.get_all_books_by_author(author_name)
    id = Author.find_author_id(author_name)
    self.where(author_id: id)
  end

  def self.get_all_titles_by_author(author_name)
    self.get_all_books_by_author(author_name).map do |book|
      book.title
    end
  end

  def self.number_of_author_books(author_name)
    self.get_all_titles_by_author(author_name).count
  end

# WORK ON GETTING DESCRIPTION OF A BOOK TITLE & CONNECTING WITH CLI

  def self.get_description(book_title)
    matched_book = self.find_by(title: book_title)
    matched_book["description"]
  end


end #end class
