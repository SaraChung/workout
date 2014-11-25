class Users::ProfilesController < UsersController
  # respond_to :js, only: [:update]
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
    @profile ||= ProfilesUser.find_or_create_by(user_id: @user.id)
  end

  def profile_params
    params[:profiles_user][:birthdate] = Date.strptime([params[:dob][:year].to_i,params[:dob][:month].to_i,params[:dob][:day]].join("-"), '%Y-%m-%d')
    params.require(:profiles_user).permit(:interests, :about, :quotes, :birthdate, :image)
  end

end
