class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants
  has_many :favourites
  has_many :favourites_restaurants, through: :favourite, source: :restaurant
end
