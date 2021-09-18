# frozen_string_literal: true

# Company Model
class Company < ApplicationRecord
  # Validations
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # Associations
  has_one_attached :logo
  has_many :employees, dependent: :destroy
end
