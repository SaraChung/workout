class Trainers::DashboardController < TrainersController
  before_filter :load_feeds, only: :index

  def index
    gon.watch.notif = @notifications
    gon.watch.count_unread = @count_unread
  end

  private

  def load_feeds
    @notifications ||= Notification.trainer_feeds(current_trainer.id).limit(10)
    @count_unread ||= Notification.count_unread(current_trainer.id)
  end
end
