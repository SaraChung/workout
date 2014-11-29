class Trainers::ProfilesController < TrainersController
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
    params[:profiles_trainer][:birthdate] = Date.strptime([params[:dob][:year].to_i,params[:dob][:month].to_i,params[:dob][:day]].join("-"), '%Y-%m-%d')
    params.require(:profiles_trainer).permit(:interests, :about, :workout_quotes, :birthdate, :image)
  end

end
