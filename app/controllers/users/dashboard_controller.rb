class Users::DashboardController < ApplicationController
  before_filter :authenticate_user!

  layout 'user_dashboard'

  def index
    
  end
end
