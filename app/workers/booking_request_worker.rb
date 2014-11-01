class BookingRequestWorker
  include Sidekiq::Worker
  # include Sidekiq::Benchmark::Worker
  
  def perform(user_id, trainer_id)
    # benchmark.sample do
      # 1.times do
        user = User.find(user_id)
        trainer = Trainer.find(trainer_id.to_i)
        push_notification = NotificationsService.new
        push_notification.push_booking_request(user, trainer)
      # end
  end
end