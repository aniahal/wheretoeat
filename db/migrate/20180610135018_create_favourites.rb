class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.string :user
      t.string :string
      t.string :restaurant
      t.string :string

      t.timestamps
    end
  end
end
