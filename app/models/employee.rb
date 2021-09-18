# frozen_string_literal: true

# Employee Model
class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable

  validates_presence_of :name, :designation
  has_one_attached :avatar
end
