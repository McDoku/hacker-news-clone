class VotesController < ApplicationController
  def create
    @user = User.find(params[:user])
    @link = Link.find(params[:link])
    @vote = @user.votes.create(:link_id => @link.id)

    redirect_to links_url
  end
end
