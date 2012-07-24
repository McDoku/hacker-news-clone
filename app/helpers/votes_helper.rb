module VotesHelper
  def valid_vote?(link)
    @link = link
    !voted? && !own_link?
  end

  private
  def voted?
    found_link = Link.find(@link)
    !Vote.where(:user_id => current_user, :link_id => found_link).empty?
  end

  def own_link?
    found_link = Link.find(@link)
    found_link.user_id == current_user.id
  end
end
