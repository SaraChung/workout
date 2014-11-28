class Users::ReviewsController < UsersController

  def index
    trainers
  end

  def new
    review
  end
  
  def create
    review
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

end
