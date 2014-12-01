class Trainers::ReviewsController < TrainersController
  
  def index
    reviews
  end

  private

  def reviews
    @reviews ||= Review.where(trainer_id: @trainer.id).order("created_at DESC").page params[:page]
  end
end
