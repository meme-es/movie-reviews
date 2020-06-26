class VotesController < ApplicationController
  def create
    vote = Vote.new(user_id: session[:user_id], review_id: params[:review_id])
    vote.save

    category = Category.find(params[:category_id])

    redirect_to category_url(category), notice: 'You voted a review'
  end

  def destroy
    vote = Vote.find(params[:vote_id])
    vote.destroy

    category = Category.find(params[:category_id])

    redirect_to category_url(category), notice: 'You undo a vote'
  end
end
