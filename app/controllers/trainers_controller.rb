class TrainersController < ApplicationController 
	before_filter :authenticate_trainer!
  before_filter :init_trainer
  layout 'dashboard'
  
  private

  def init_trainer
  	@trainer ||= current_trainer.decorate
  end
end
