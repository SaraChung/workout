class HomeController < ApplicationController
  def index
  end

  def login
    @user = User.find_by_email_and_phone_number(params[:email], params[:phone_number])
    set_session unless @user.nil?
    redirect_to root_path if @user.nil?
  end

  private

  def set_session
    set_user_session
    redirect_to users_dashboard_index_path
  end

end
