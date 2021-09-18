# frozen_string_literal: true

# Video references updated
class UpdateVideoReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :videos, :employee, index: true, foreign_key: true
    add_reference :videos, :employee_challenge, index: true, foreign_key: true
  end
end
