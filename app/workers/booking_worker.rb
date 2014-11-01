class BookingWorker
  include Sidekiq::Worker
  def perform(user_id, trainer_id)
    user = User.find(user_id)
    trainer = Trainer.find(trainer_id)
    push_notification = NotificationsService.new
    push_notification.push_booking_notification(user, trainer)
  end
end