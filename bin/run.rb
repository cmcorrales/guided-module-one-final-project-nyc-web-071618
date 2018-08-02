require_relative '../config/environment.rb'
require_relative "../bin/command_line_interface.rb"
require 'pry'

def get_books
  @result["results"].each do |book_hash|
    book_hash
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



create_books
