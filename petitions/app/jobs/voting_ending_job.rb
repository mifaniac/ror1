class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    p "========== STARTING JOB =========="
    Petition.expired.each do |petition|
    case
    when petition.votes.count < MIN_VOTES
      UserMailer.unsuccessful_petition_user(petition).deliver_later
    when petition.votes.count >= MIN_VOTES
      UserMailer.successful_petition_user(petition).deliver_later
      UserMailer.successful_petition_admin(petition).deliver_later
    end
    end
    p "========== ENDED JOB =========="
  end
end
