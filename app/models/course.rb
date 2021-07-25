# frozen_string_literal: true

# Class for courses model
class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  LANGUAGES = %i[English Spanish German].freeze
  LEVELS = %i[Beginner Intermediate Advanced].freeze

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

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
