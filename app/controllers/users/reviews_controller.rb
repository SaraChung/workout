class Users::ReviewsController < UsersController

  def index
    trainers
  end

  def new
    review
  end
  
  def create
    review
    send_notif
    @review.update_attributes(review_params)
    @review.save 
  end

  private

  def trainers
    @trainers = Trainer.reviewable(@user.id)  
  end

  def review
    @review = Review.find_or_initialize_by(user_id: @user.id, trainer_id: params[:trainer_id])
  end

  def review_params
    params.require(:review).permit(:comments, :rating)
  end

  def send_notif
    type = @review.persisted? ? "Create" : "Update"
    GiveReviewsWorker.perform_in(1.minutes, @user.id, @review.trainer_id, type, trainers_reviews_path)
  end

end
