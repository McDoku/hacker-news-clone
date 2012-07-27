class VotesController < ApplicationController
  def create
    if params[:link_id]
      votable = Link.find(params[:link_id])
    else
      votable = Comment.find(params[:comment_id])
    end

    current_user.votes.create(:votable => votable, :direction => params[:direction])
    flash[:success] = "Thanks for voting."
    redirect_to :back
  end
end
