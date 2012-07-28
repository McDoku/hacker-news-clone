class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:success] = "Welcome back!"
      redirect_to links_path
    else
      flash.now[:error] = "Wrong email or password."
      render :new
    end
  end
end
