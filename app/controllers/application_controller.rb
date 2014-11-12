class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include DeviseOverrides
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :is_xhr?

  def is_xhr?
    false if request.xhr?
  end

  def set_user_session
    sign_in(:user, @user) if @user
  end

end
