# frozen_string_literal: true

# Class for users model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :courses

  def to_s
    email
  end

  def username
    email.split(/@/).first
  end
end
