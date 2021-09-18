# frozen_string_literal: true

# Company Challenge Model
class CompanyChallenge < ApplicationRecord
  # Validations
  validates_presence_of :date

  # Associations
  belongs_to :challenge
  belongs_to :company
  has_many :polls, dependent: :destroy
end
