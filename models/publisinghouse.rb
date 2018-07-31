class PublishingHouse < ActiveRecord::Base[4.2]
  has_many :books
  has_many :authors, through: :books
end