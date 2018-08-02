class Author < ActiveRecord::Base
  has_many :books
  has_many :publishing_houses, through: :books

  def self.find_author_id(author_name)

    author_instance = self.find_by(name: author_name)
    if author_instance == nil
      "Your author, #{author_name}, has yet to make it on the Best Seller's list!"
    else
      author_instance.id
    end
  end
end #end class
