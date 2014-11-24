class Trainers::ProfilesController < TrainersController
  respond_to :js, only: [:update]
  before_action :profile
  
  def show
  end

  def edit
    
  end

  def update
    @profile.update(profile_params)
  end

  private

  def profile
    @profile ||= ProfilesTrainer.find_or_create_by(trainer_id: current_trainer.id)
  end

  def profile_params
    params.require(:profiles_trainer).permit(:interests, :about, :workout_quotes, :birthdate, :image)
  end

end
