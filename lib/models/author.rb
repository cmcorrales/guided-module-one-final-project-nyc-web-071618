class Author < ActiveRecord::Base
  has_many :books
  has_many :publishing_houses, through: :books
end
