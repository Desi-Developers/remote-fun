# frozen_string_literal: true

# Employee Challenge Model
class EmployeeChallenge < ApplicationRecord
  # Associations
  belongs_to :employee
  belongs_to :challenge
  has_many :poll_votes, dependent: :destroy
  has_many :winners, dependent: :destroy
end
