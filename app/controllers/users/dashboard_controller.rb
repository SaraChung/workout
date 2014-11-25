class Users::DashboardController < UsersController
  before_filter :load_feeds, only: [:index, :latest_feeds]

  def index
    gon.watch.notif = @notifications
  end

  def latest_feeds
    
  end

  private

  def load_feeds
    @notifications ||= Notification.user_feeds(current_user.id).limit(10)
  end
end
