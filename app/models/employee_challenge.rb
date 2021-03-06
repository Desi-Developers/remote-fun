# frozen_string_literal: true

# Employee Challenge Model
class EmployeeChallenge < ApplicationRecord
  # Associations
  belongs_to :employee
  belongs_to :challenge
  has_many :poll_votes, dependent: :destroy
  has_many :winners, dependent: :destroy
  has_one :video, dependent: :destroy

  delegate :name, to: :employee

  scope :for_this_month, -> { where('created_at > ?', Date.current.beginning_of_month.beginning_of_day) }
  scope :for_this_day, -> { where('employee_challenges.created_at > ?', Date.current.beginning_of_day) }

  after_create :send_challenge_email

  private

  def send_challenge_email
    link = "#{ENV['BASE_URL']}/challenges/attempt/#{challenge.id}"
    EmployeeMailer.send_challenge_email(employee, link).deliver_now
  end
end
