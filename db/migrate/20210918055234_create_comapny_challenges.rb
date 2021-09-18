# frozen_string_literal: true

# Company Challenges Schema
class CreateComapnyChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :comapny_challenges do |t|
      t.date :date, null: false
      t.references :challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
