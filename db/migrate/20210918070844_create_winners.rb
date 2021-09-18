# frozen_string_literal: true

# Winners Schema
class CreateWinners < ActiveRecord::Migration[6.0]
  def change
    create_table :winners do |t|
      t.references :poll, null: false, foreign_key: true
      t.references :employee_challenge, null: false, foreign_key: true
      t.date :date
      t.timestamps
    end
  end
end
