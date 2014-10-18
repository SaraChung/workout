if Session.count.zero?
  trainers = Trainer.joins(:exercises)
  users = User.all.pluck(:id)
  15.times do
    start_session = Time.now + (1..7).to_a.sample.days + 3.hours
    Session.create(trainer_id: trainers.pluck(:id).sample, user_id: users.sample, from_when: start_session, to_when: start_session + 45.minutes, is_private: [1, 0].sample, status: true)
  end 
end