# frozen_string_literal: true

# Challenge Model
class Challenge < ApplicationRecord
  # Validations
  validates_presence_of :name, :description

  # Associations
  has_many :company_challenges, dependent: :destroy
  has_many :companies, through: :company_challenges
  has_many :employee_challenges, dependent: :destroy
  has_many :employees, through: :employee_challenges
end
