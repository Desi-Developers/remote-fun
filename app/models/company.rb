# frozen_string_literal: true

# Company Model
class Company < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_one_attached :logo
end
