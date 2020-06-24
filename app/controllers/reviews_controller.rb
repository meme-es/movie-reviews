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

    if @review.save
      redirect_to reviews_path, notice: 'New review successfully created'
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
