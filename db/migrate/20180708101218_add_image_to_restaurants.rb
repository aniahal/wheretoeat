class AddImageToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :image, :text
  end
end
