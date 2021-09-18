# frozen_string_literal: true

# Challenge Schema
class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
