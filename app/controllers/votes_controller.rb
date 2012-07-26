class VotesController < ApplicationController
  def create
    @link = Link.find(params[:link_id])

    @vote = current_user.votes.new(:value => params[:value])
    @vote.link_id = @link.id
    @vote.save!

    redirect_to :back
  end
end
