# frozen_string_literal: true

# Poll Vote Model
class PollVote < ApplicationRecord
  # Associations
  belongs_to :poll
  belongs_to :employee_challenge
end
