# frozen_string_literal: true

# Mailer for Employees
class EmployeeMailer < ApplicationMailer
  def send_password_instructions_email(employee)
    @employee = employee
    mail(to: employee.email, subject: "Welcome to the #{employee.company.name}. Here are your credentials")
  end

  def send_challenge_email(employee, link)
    @employee = employee
    @link = link
    mail(to: employee.email, subject: "New Challenge link is here")
  end
end
