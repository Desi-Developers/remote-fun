# frozen_string_literal: true

# Polls Schema
class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.integer :p_type, default: 0
      t.references :company_challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
