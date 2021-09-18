# frozen_string_literal: true

# Videos Schema
class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.references :employee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
