class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include DeviseOverrides
  before_filter :configure_permitted_parameters, if: :devise_controller?
end
