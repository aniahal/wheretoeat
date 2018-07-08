class Restaurant < ApplicationRecord
  has_many :favourites
  has_many :favourites_by, through: :favourites, source: :user
  belongs_to :user
  belongs_to :city
  validates :name, presence: true
  validates :street, presence: true
  validates :tags, presence: true

  has_one_attached :image

  def tags=(value)
    super(sanitize_tags(value))
  end

  private

  def sanitize_tags(tags = '')
    tags.downcase.split(',').map(&:strip).uniq
  end
end
