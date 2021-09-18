# frozen_string_literal: true

# Renaming the wrong name for Company Challenge table
class RenameComapnyChallengeToCompanyChallenge < ActiveRecord::Migration[6.0]
  def change
    rename_table :comapny_challenges, :company_challenges
  end
end
