# frozen_string_literal: true

namespace :challenge do
  desc 'Generate challenges'
  task create_random: :environment do
    Company.includes(:employees).each do |company|
      challenge = Challenge.all.sample(1).first
      next if challenge.blank?

      company_challenge = company.company_challenges.create(challenge_id: challenge.id, date: Date.current)

      next unless company_challenge.present?

      employees = find_participants(company)
      employees.each do |employee|
        EmployeeChallenge.create(challenge_id: challenge.id, employee_id: employee.id)
      end
    end
  end

  private

  def find_participants(company)
    company.employees.not_challenged_this_month.sample(4)
  end
end

