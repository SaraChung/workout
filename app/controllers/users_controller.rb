class UsersController < ApplicationController 
  before_filter :authenticate_user!
  before_filter :init_variables
  before_filter :init
  layout :xhr_request?
  
  private

  def xhr_request?
    request.xhr? ? false : 'dashboard'
  end

  def init_variables
    @user ||= current_user
    @count_unread ||= Notification.count_unread_user(@user.id)
  end

  def init
    gon.watch.count_unread = @count_unread
  end
end
