module ApplicationHelper
  def vote_undo_link(review_id, category_id)
    vote = Vote.find_by(user_id: session[:user_id], review_id: review_id)
    if vote
      link_to('Undo!', vote_path(vote_id: vote.id, category_id: category_id), method: :delete)
    else
      link_to('Vote!', votes_path(review_id: review_id, category_id: category_id), method: :post)
    end
  end
end
