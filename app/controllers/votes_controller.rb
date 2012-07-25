class VotesController < ApplicationController
  def create
    @user = current_user
    @link = Link.find(params[:link_id])
    @vote = @user.votes.create(:link_id => @link.id)

    redirect_to links_url
  end
end
