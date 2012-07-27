module VotesHelper
  def valid_vote?(votable)
    @votable = votable
    !voted? && !own_votable?
  end

  private
  def voted?
    Vote.where(:user_id => current_user, :votable_id => @votable, :votable_type => @votable.class).any?
  end

  def own_votable?
    @votable.user_id == current_user.id
  end
end
