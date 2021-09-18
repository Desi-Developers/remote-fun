# frozen_string_literal: true

# Employees and Challenges relations Schema
class CreateEmployeeChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_challenges do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
