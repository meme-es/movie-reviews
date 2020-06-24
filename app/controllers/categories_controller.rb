class CategoriesController < ApplicationController
  before_action :authorize

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(parameters)

    if @category.save
      redirect_to categories_path, notice: "New category \"#{parameters[:name]}\" successfully created"
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def parameters
    params.require(:category).permit(:name, :priority)
  end
end
