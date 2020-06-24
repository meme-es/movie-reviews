class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(parameters)
    @review.author_id = 1
    @review.save

    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def parameters
    params.require(:review).permit(:title, :text)
  end
end
