class Users::WorkoutSessionsController < UsersController
  before_filter :find_workout, only:[:show, :update_status, :destroy]
  before_filter :workouts, only:[:index]

  def index
    render params[:time] if params[:time]
  end

  def show
    
  end

  def destroy
    WorkoutsRemovalWorker.perform_async(current_user.id, "User", @workout.trainer_id, "Trainer", @workout.id)
  end

  private

  def workouts
    @workouts ||= Session.whose_user(current_user.id).order("sessions.from_when ASC")
  end

  def find_workout
    @workout ||= Session.find_by_id_and_user_id(params[:id], current_user.id)
  end

end