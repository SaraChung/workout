class Trainers::NotificationsController < TrainersController
  respond_to :html, :js, only: [:show, :latest_feeds]
  before_filter :load_feeds, only: [:index, :latest_feeds]
  
  def index
  end

  def show
    @notification = Notification.find(params[:notif_id])
    @notification.update_attributes(is_read: "true")
  end

  def latest_feeds
    
  end

  private

  def load_feeds
    @notifications ||= Notification.trainer_feeds(current_trainer.id).page params[:page]
  end

end
