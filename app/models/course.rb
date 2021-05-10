class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_rich_text :description
  
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :short_description, presence: true
  validates :language, presence: true
  validates :level, presence: true
  validates :price, presence: true

  def to_s
    title
  end
end
