# frozen_string_literal: true

# Employees Controller
class EmployeesController < ApplicationController
  before_action :authenticate_company!
  before_action :set_employee, only: %i[destroy]

  def index
    @employees = current_company.employees
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = current_company.employees.new(employee_params)
    @employee.password = 'password'
    if @employee.save
      send_email_to_employee(@employee)
      redirect_to employees_path, notice: 'Employee added successfully'
    else
      render 'new'
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: 'Employee deleted successfullys'
    end
  end

  private

  def set_employee
    @employee = Employee.find_by_id(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :designation, :email)
  end

  def send_email_to_employee(employee)
    EmployeeMailer.send_password_instructions_email(employee).deliver_now
  end
end
