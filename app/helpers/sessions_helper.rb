module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def signed_in?
    session[:user_id] ? true : false
  end

  def authorize
    unless signed_in?
      flash[:error] = "Please sign in or create an account."
      redirect_to :back
    end
  end
end
