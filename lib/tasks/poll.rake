namespace :poll do
  desc 'Create daily poll'
  task create_daily: :environment do
    puts 'Creating daily Poll'

    Company.all.includes(company_challenges: {challenge: :employee_challenges}).each do |company|
      company_challenge = company.company_challenges.order(id: :desc).first
      next if company_challenge.blank?

      if company_challenge.challenge&.employee_challenges&.where('created_at >= ?', DateTime.current.beginning_of_day)&.present?
        Poll.create(company_challenge_id: company_challenge.id, p_type: :daily)
      end
    end

    puts 'Daily poll creation complete'
  end
end
