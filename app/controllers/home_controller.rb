class HomeController < ApplicationController
  before_action :authenticate_employee!

  def index
    @activity_for_today = {
      selected_participants: EmployeeChallenge.for_this_day
                                              .includes(:employee, :challenge)
                                              .where(employees: {
                                                company_id: current_employee.company_id
                                              })
    }
  end
end
