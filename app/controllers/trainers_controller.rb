class TrainersController < ApplicationController 
  before_filter :authenticate_trainer!
  before_filter :init_trainer
  layout :xhr_request?
  
  private

  def xhr_request?
    request.xhr? ? false : 'dashboard'
  end

  def init_trainer
    @trainer ||= current_trainer.decorate
  end
end
