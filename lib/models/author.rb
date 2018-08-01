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



#Raymond E Feist
# def self.check_for_author(author)
#   if Author.where(name: author)
#
#   else
#
#   end
# end
#
# def self.author_present?(author)
#   if Author.find_by(name: author)
#     "Your author, #{author}, has made it on the Best Seller's list!"
#   else
#     "Sorry! #{author} has yet to make it on the Best Seller's!"
#   end
# end
#
# def self.get_author_id(author)
#   if Author.find_by(name: author)
#     Author.id
#   else
#     "Sorry! We couldn't find your author in our database."
#   end




end #end class
