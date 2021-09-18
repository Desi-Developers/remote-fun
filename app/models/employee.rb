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
  has_many :employee_challenges, dependent: :destroy
  has_many :challenges, through: :employee_challenges

  scope :not_challenged_this_month, -> { where.not(id: EmployeeChallenge.for_this_month) }
end
