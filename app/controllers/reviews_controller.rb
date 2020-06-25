class ReviewsController < ApplicationController
  before_action :authorize

  def index
    @featured = Review.featured
    @four_most = Category.four_most
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @categories = Category.by_priority
  end

  def create
    @review = current_user.reviews.build(parameters)
    @review.category_ids = params[:ids_list]

    if @review.save
      redirect_to reviews_path, notice: 'New review successfully created, you can check it in its category'
    else
      @categories = Category.by_priority
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
