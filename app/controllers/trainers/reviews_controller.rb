class Trainers::ReviewsController < TrainersController
  
  def index
  end

  private

  def reviews
    @reviews ||= Review.where(trainer_id: current_trainer.id)
  end
end
