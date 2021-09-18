# frozen_string_literal: true

# Poll Votes Schema
class CreatePollVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_votes do |t|
      t.references :poll, null: false, foreign_key: true
      t.references :employee_challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
