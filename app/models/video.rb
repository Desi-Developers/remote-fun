# frozen_string_literal: true

# Video Model
class Video < ApplicationRecord
  belongs_to :employee_challenge
  has_one :employee, through: :employee_challenge
  has_one :challenge, through: :employee_challenge
  has_one_attached :file
end
