class BookingWorker
  include Sidekiq::Worker
  def perform(user_id)
    user = User.find(user_id)
    registration_service = RegistrationService.new
    registration_service.register_user(@user)
  end
end