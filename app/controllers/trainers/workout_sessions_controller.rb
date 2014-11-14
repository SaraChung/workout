class Trainers::WorkoutSessionsController < TrainersController
  def index
    
  end

  def show
    
  end

  private

  def workouts
    @workouts ||= Session.whose(current_trainer.id)
  end

end
