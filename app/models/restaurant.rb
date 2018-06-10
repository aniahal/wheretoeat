class Restaurant < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
end
