module ApplicationHelper
  def vote_undo_link(review_id, category_id)
    vote = Vote.find_by(user_id: session[:user_id], review_id: review_id)
    if vote
      link_to(
        image_tag('t-null', class: 'img-vote'),
        vote_path(vote_id: vote.id, category_id: category_id),
        method: :delete, class: 'vote'
      )
    else
      link_to(
        image_tag('t-up', class: 'img-vote'),
        votes_path(review_id: review_id, category_id: category_id),
        method: :post, class: 'vote'
      )
    end
  end
end
