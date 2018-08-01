class Book < ActiveRecord::Base
  belongs_to :publishing_house
  belongs_to :author

  def get_books
    @result["results"].each do |book|
      book
    end
  end

  def create_books
    get_books.map do |book|
      title = book["title"]
      author = book["author"]
      publisher = book["publisher"]
      age_group = book["age_group"]
      has_weeks_on_list = book["ranks_history"].find do |hash|
        hash["weeks_on_list"] != ""
      end
      weeks_on_list = has_weeks_on_list["weeks_on_list"]
      has_date_published = book["ranks_history"].find do |hash|
        hash["published_date"] != ""
      end
      published_date = has_date_published["published_date"]

      Author.create(:name => author)
      PublishingHouse.create(:name => publisher)
      #{"#title"}
    end
  end


end #end class
