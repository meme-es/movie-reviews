class ReviewsController < ApplicationController
  before_action :authorize

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(parameters)
    @review.author_id = session[:user_id]

    if @review.save
      redirect_to reviews_path, notice: 'New review successfully created, you can check it in its category'
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def parameters
    params.require(:review).permit(:title, :text, :image)
  end
end
