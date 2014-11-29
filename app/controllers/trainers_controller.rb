class TrainersController < ApplicationController 
  before_filter :authenticate_trainer!
  before_filter :init_variables
  before_filter :init
  layout :xhr_request?
  
  private

  def xhr_request?
    request.xhr? ? false : 'dashboard'
  end

  def init_variables
    @trainer ||= current_trainer.decorate
    @count_unread ||= Notification.count_unread_trainer(@trainer.id)
  end

  def init
    gon.watch.count_unread = @count_unread
  end
end
