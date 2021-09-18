# frozen_string_literal: true

# Video Model
class Video < ApplicationRecord
  belongs_to :employee
  has_one_attached :file
end
