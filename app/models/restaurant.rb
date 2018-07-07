class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :name, presence: true
  validates :street, presence: true
  validates :tags, presence: true


  def tags=(value)
    super(sanitize_tags(value))
  end

  private

  def sanitize_tags(tags = '')
    tags.downcase.split(',').map(&:strip).uniq
  end
end
