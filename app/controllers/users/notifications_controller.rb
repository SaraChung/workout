class Users::NotificationsController < UsersController
  respond_to :html, :js, only: [:show, :latest_feeds]
  before_filter :load_feeds, only: [:index, :latest_feeds]
  before_filter :feed, only: [:show, :destroy]
  
  def index
  end

  def show
    @notification.update_attributes(is_read: "true")
  end

  def destroy
    @notification.destroy
  end

  def latest_feeds
    
  end

  private

  def load_feeds
    @notifications ||= Notification.user_feeds(current_user.id).page params[:page]
  end

  def feed
    @notification ||= Notification.find(params[:id])
  end

end
