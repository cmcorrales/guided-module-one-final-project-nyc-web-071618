class CreatePublishingHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :publishing_houses do |t|
      t.string :name
    end
  end
end
