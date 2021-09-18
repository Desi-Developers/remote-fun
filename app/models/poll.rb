# frozen_string_literal: true

# Poll Model
class Poll < ApplicationRecord
  # Enum Fields
  enum p_type: { daily: 0, monthly: 1 }

  # Associations
  belongs_to :company_challenge, optional: true
  has_many :poll_votes, dependent: :destroy
  has_many :winners, dependent: :destroy
end
