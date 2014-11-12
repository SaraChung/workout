class BookingRequestWorker
  include Sidekiq::Worker
  
  def perform(user_id, trainer_id, session_id, url)
    user = User.find(user_id)
    push_notification = NotificationsService.new
    push_notification.push_booking_request(user, trainer_id, session_id, url)
  end
end