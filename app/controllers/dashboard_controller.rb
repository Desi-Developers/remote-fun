# frozen_string_literal: true

# Dashboard Controller
class DashboardController < ApplicationController
  def dashboard
    if company_signed_in?
      @employees = current_company.employees
    end
  end
end
