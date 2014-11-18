class Trainers::WorkoutSessionsController < TrainersController
  before_filter :find_workout, only:[:show, :update_status, :delete]
  before_filter :workouts, only:[:index]

  def index
    render params[:time] if params[:time]
  end

  def show
    
  end

  def update_status
    @workout.update_attributes(status: params[:status])
    BookingConfirmationWorker.perform_async(current_trainer.id, @workout.id, users_workout_session_path(@workout.id))
    head :ok
  end

  private

  def workouts
    @workouts ||= Session.whose(current_trainer.id).order("sessions.from_when ASC")
  end

  def find_workout
    @workout ||= Session.find_by_id_and_trainer_id(params[:id], current_trainer.id)
  end

end