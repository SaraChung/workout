class TrainersController < ApplicationController 
  layout 'dashboard'
  before_filter :init_trainer
  
  private
  
  def init_trainer
  	@trainer ||= current_trainer.decorate
  end
end
