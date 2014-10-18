class Users::BooksController < ApplicationController
  def new
    
  end

  def create
    
  end

  def find_trainer
    @trainers = Trainer.available
  end

  private

  def search_trainer_params
    params.permit(:book_date, :book_time, :book_range, :book_location, :book_exercise, :book_is_trainer)
  end

end
