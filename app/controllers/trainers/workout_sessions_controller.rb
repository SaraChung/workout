class Trainers::WorkoutSessionsController < TrainersController
  before_filter :find_workout, only:[:show, :edit, :update, :delete]

  def index
    
  end

  def show
    
  end

  private

  def workouts
    @workouts ||= Session.whose(current_trainer.id)
  end

  def find_workout
    @workout ||= Session.find_by_id_and_trainer_id(params[:id], current_trainer.id)
  end

end