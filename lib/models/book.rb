class Book < ActiveRecord::Base
  belongs_to :publishing_house
  belongs_to :author

  def get_books
    @result["results"].each do |book|
      book
    end
  end

  def create_books #array of titles
    get_books.map do |hash|
      hash["title"]
    end
  end

end #end class
