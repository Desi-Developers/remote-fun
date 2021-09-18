# frozen_string_literal: true

# Add company reference to company challenges
class AddCompanyReferencesToCompanyChallenges < ActiveRecord::Migration[6.0]
  def change
    add_reference :comapny_challenges, :company, foreign_key: true
  end
end
