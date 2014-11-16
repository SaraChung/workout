class Trainers::WorkoutSessionsController < TrainersController
  before_filter :find_workout, only:[:show, :update_status, :delete]

  def index
    
  end

  def show
    
  end

  def update_status
    @workout.update_attributes(status: params[:status])
    head :ok
  end

  private

  def workouts
    @workouts ||= Session.whose(current_trainer.id)
  end

  def find_workout
    @workout ||= Session.find_by_id_and_trainer_id(params[:id], current_trainer.id)
  end

end