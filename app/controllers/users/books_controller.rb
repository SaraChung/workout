class Users::BooksController < ApplicationController
  respond_to :html, :js, only: [:find_trainer]

  def new
    
  end

  def create
    
  end

  def find_trainer
    @trainers = Trainer.available(params[:book_exercise], to_date(params[:book_time]), to_date(params[:book_time]) + params[:book_range].to_i.minutes, params[:book][:is_trainer], params[:book_location])
  end
  
  private

  def to_date(date)
    DateTime.new(date[:year].to_i, date[:month].to_i, date[:day].to_i, date[:hour].to_i, date[:minute].to_i)
  end
end
