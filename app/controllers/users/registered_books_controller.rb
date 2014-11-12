class Users::RegisteredBooksController < ApplicationController
  respond_to :html, :js, only: [:find_trainer]
  after_filter :set_user_session, only: [:create]

  def create
    set_user
    if @user.persisted? && @session.persisted?
      BookingRequestWorker.perform_async(@user.id, params[:rbook_trainer], @session.id)
      redirect_to users_dashboard_index_path, notice: "Your booking has been sent to #{@trainer}! #{@trainer} will send the confirmation to you. Please check your dashboard for the confirmation."
    else
      redirect_to root_path
    end
  end

  def find_trainer
    location = User.where_is(params[:user_email])
    @trainers = Trainer.available(params[:exercise], params[:from], params[:to], params[:trainer], location)
  end
  
  private

  def set_user
    @user = User.find_by_email_and_phone_number(params[:rbook_email], params[:rbook_phone])
    set_session unless @user.nil?
  end

  def set_session
    @session = Session.create(trainer_id: params[:rbook_trainer], user_id: @user.id, exercise_id: params[:rbook_exercise], from_when: params[:rbook_from], to_when: params[:rbook_to], status: 0, is_private: params[:rbook_is_private])
    @trainer = Trainer.who_is(params[:rbook_trainer])[0]
  end

end
