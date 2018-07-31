class Book < ActiveRecord::Base[4.2]
  belongs_to :publishing_house
  belongs_to :author
end