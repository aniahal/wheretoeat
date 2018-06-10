class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
