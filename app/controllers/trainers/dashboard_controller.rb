class Trainers::DashboardController < TrainersController
  before_filter :load_feeds, only: [:index, :latest_feeds]

  def index
    gon.watch.notif = @notifications
  end

  def latest_feeds
    
  end

  private

  def load_feeds
    @notifications ||= Notification.trainer_feeds(current_trainer.id).limit(10)
  end
end
