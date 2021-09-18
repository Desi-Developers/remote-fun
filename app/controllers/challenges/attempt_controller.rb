class Challenges::AttemptController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_challenge

  def show; end

  private

  def set_challenge
    @challenge = Challenge.find_by(id: params[:id])

    redirect_to root_path, alert: 'Invalid challenge id' and return if @challenge.blank?

    redirect_to root_path, alert: 'Invalid challenge id' unless @challenge&.employee_ids&.include? current_employee&.id
  end
end
