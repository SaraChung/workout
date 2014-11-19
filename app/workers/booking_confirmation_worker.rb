class BookingConfirmationWorker
  include Sidekiq::Worker
  
  def perform(trainer_id, session_id, url)
    trainer = Trainer.find(trainer_id)
    session = Session.find(session_id)
    push_notification = NotificationsService.new
    push_notification.push_booking_confirmation(trainer, session, url)
  end
end