# frozen_string_literal: true

# Company Challenge Model
class ComapnyChallenge < ApplicationRecord
  # Validations
  validates_presence_of :date

  # Associations
  belongs_to :challenge
end
