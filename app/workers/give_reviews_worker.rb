class GiveReviewsWorker
  include Sidekiq::Worker
  
  def perform(user_id, trainer_id, type, url)
    user = User.find(user_id)
    push_notification = NotificationsService.new
    push_notification.push_give_reviews(user, trainer_id, type, url)
  end
end