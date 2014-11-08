class Trainers::DashboardController < TrainersController
  before_filter :load_feeds, only: :index

  def index
    
  end

  private

  def load_feeds
    @notifications ||= Notification.trainer_feeds(current_trainer.id)
  end
end
