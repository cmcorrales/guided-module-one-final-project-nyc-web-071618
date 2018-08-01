class Book < ActiveRecord::Base
  belongs_to :publishing_house
  belongs_to :author

  def get_books
    @result["results"].each do |book|
        binding.pry
      book
    end
  end

  def create_books
    get_books.map do |book|
      title = book["title"]
      author = book["author"]
      publisher = book["publisher"]
      age_group = book["age_group"]
      if book["ranks_history"] == []
        weeks_on_list = nil
        published_date = nil
      else
        has_weeks_on_list = book["ranks_history"].find do |hash|
          hash["weeks_on_list"] != ""
        end
        has_date_published = book["ranks_history"].find do |hash|
          hash["published_date"] != ""
        end
        weeks_on_list = has_weeks_on_list["weeks_on_list"]
        published_date = has_date_published["published_date"]
      end
      author_instance = Author.find_or_create_by(:name => author)
      # Author.create(:name => author)
      # publisher_instance = PublishingHouse.create(:name => publisher)
      publisher_instance = PublishingHouse.find_or_create_by(:name => publisher)
      Book.create(:title => title, :author_id => author_instance.id , :publishing_house_id => publisher_instance.id, :age_group => age_group, :weeks_on_list => weeks_on_list, :published_date => published_date)
    end
  end

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

#WORK ON GETTING DESCRIPTION OF A BOOK TITLE & CONNECTING WITH CLI

  # def self.get_description(book_title)
  #   get_books.find do |book|
  #     binding.pry
  #     book["title"] == book_title
  #   end
  #   # title["description"]
  # end


end #end class
