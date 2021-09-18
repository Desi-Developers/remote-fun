# frozen_string_literal: true

# Winner Model
class Winner < ApplicationRecord
  # Associations
  belongs_to :poll
  belongs_to :employee_challenge
end
