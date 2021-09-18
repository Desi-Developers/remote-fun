# frozen_string_literal: true

# Adding company reference to employees table
class AddCompanyReferenceToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :company, foreign_key: true
  end
end
