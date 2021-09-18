# frozen_string_literal: true

module Challenges
  # Challenge Attempt Controller
  class AttemptController < ApplicationController
    before_action :authenticate_employee!
    before_action :set_challenge

    def show
      @employee_challenge = EmployeeChallenge.find_by(challenge: @challenge, employee: current_employee)
    end

    private

    def set_challenge
      @challenge = Challenge.find_by(id: params[:id])

      redirect_to root_path, alert: 'Invalid challenge id' and return if @challenge.blank?

      redirect_to root_path, alert: 'Invalid challenge id' unless @challenge&.employee_ids&.include? current_employee&.id
    end
  end
end
