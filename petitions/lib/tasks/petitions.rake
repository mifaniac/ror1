namespace :petitions do
  desc "Stop voting on old petitions"
  task check_expired: :environment do
    VotingEndingJob.perform_later
  end
end