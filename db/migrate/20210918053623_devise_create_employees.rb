# frozen_string_literal: true

# Employees schema
class DeviseCreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      ## General Fields
      t.string :name
      t.string :designation
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      t.timestamps null: false
    end
    add_index :employees, :email,                unique: true
    add_index :employees, :reset_password_token, unique: true
    add_index :employees, :confirmation_token,   unique: true
  end
end
