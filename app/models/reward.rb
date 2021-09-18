# frozen_string_literal: true

# Reward Model
class Reward < ApplicationRecord
  # Validations
  validates_presence_of :daily, :monthly
end
