class Trainers::ReviewsController < TrainersController
  
  def index
    reviews
  end

  private

  def reviews
    @reviews ||= Review.where(trainer_id: @trainer.id).page params[:page]
  end
end
