class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      #user_id: params[:user_id],

      body: review_params["body"]
    )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end


