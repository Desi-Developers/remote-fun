# frozen_string_literal: true

# Employee Challenge Model
class EmployeeChallenge < ApplicationRecord
  belongs_to :employee
  belongs_to :challenge
end
