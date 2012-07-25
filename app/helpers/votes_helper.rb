module VotesHelper
  def valid_vote?(link)
    @link = link
    !voted? && !own_link?
  end

  private
  def voted?
    Vote.where(:user_id => current_user, :link_id => @link).any?
  end

  def own_link?
    @link.user_id == current_user.id
  end
end
