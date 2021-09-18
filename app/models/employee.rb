# frozen_string_literal: true

# Employee Model
class Employee < ApplicationRecord
  # Configuration
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable

  # Validations
  validates_presence_of :name, :designation

  # Assocations
  belongs_to :company
  has_one_attached :avatar
  has_many :employee_challenges
  has_many :challenges, through: :employee_challenges
end
