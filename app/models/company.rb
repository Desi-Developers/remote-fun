# frozen_string_literal: true

# Company Model
class Company < ApplicationRecord
  # Configuration
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Validations
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  # Associations
  has_one_attached :logo
  has_many :employees, dependent: :destroy
  has_many :company_challenges, dependent: :destroy
  has_many :challenges, through: :company_challenges
end
