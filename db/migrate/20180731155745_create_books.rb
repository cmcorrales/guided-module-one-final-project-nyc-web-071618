class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :publishing_house_id
      t.string :age_group
      t.integer :weeks_on_list
      t.string :published_date
    end
  end
end
