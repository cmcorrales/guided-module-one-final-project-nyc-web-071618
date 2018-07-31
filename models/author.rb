class Author < ActiveRecord::Base[4.2]
  has_many :books
  has_many :publishing_houses, through: :books
end