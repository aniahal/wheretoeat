class CityColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :city, index: true
    remove_column :restaurants, :city
  end
end
