class Users::BooksController < ApplicationController
  respond_to :html, :js, only: [:find_trainer]

  def create
    set_user
    set_session
    redirect_to users_dashboard_index_path, notice: "Your booking has been sent to #{@trainer}! #{@trainer} will send the confirmation to you. Please check your dashboard for the confirmation." if @user.persisted? && @session.persisted?
  end

  def find_trainer
    @trainers = Trainer.available(params[:book_exercise], to_date(params[:book_time]), to_date(params[:book_time]) + params[:book_range].to_i.minutes, params[:book][:is_trainer], params[:book_location])
  end
  
  private

  def to_date(date)
    DateTime.new(date[:year].to_i, date[:month].to_i, date[:day].to_i, date[:hour].to_i, date[:minute].to_i)
  end

  def set_params
    
  end

  def set_user
    @user = User.create(first_name: params[:booker_first_name], last_name: params[:booker_last_name], email: params[:booker_email], phone_number: params[:booker_phone_number])
  end

  def set_session
    @session = Session.create(trainer_id: params[:booker_which_trainer], user_id: @user.id, exercise_id: params[:booker_exercise], from_when: params[:booker_from], to_when: params[:booker_to], status: 0, address: params[:booker_location])
    @trainer = Trainer.who_is(params[:booker_which_trainer])[0]
  end

end
