class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :name, presence: true
  validates :street, presence: true
end
