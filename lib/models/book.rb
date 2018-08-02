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
def self.get_author_from_title(book_title)
  book_instance = self.find_by(title: book_title)
  author_id = book_instance["author_id"]
  author_instance = Author.where(id: author_id)
  author_instance[0].name
end

def self.get_published_date_from_title(book_title)
  book_instance = self.find_by(title: book_title)
  book_instance.published_date
end

def self.get_weeks_on_list_from_title(book_title)
  book_instance = self.find_by(title: book_title)
  book_instance.weeks_on_list
end

end #end class
