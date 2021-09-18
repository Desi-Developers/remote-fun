# frozen_string_literal: true

# Rewards Schema
class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.string :monthly, null: false
      t.string :daily, null: false
      t.timestamps
    end
  end
end
