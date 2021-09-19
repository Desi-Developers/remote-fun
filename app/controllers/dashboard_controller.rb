# frozen_string_literal: true

# Dashboard Controller
class DashboardController < ApplicationController
  def dashboard
    if company_signed_in?
      @employees = current_company.employees
    elsif employee_signed_in?
      @activity_for_today = {
        selected_participants: EmployeeChallenge.for_this_day
                                                .includes(:employee, :challenge)
                                                .where(employees: {
                                                  company_id: current_employee.company_id
                                                })
      }
    else
    end
  end

  def winners; end

  def activities; end
end
