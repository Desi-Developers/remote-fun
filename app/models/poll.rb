# frozen_string_literal: true

# Poll Model
class Poll < ApplicationRecord
  # Enum Fields
  enum p_type: { Daily: 0, Monthly: 1 }

  # Associations
  belongs_to :company_challenge
  has_many :poll_votes, dependent: :destroy
  has_many :winners, dependent: :destroy
end
