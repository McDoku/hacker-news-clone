class LinksController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

  def index
    @links = Link.order(:url).page(params[:page])
  end

  def new
    @link = current_user.links.new
  end

  def create
    @link = current_user.links.new(params[:link])

    if @link.save
      flash[:success] = "Thanks for submitting a link."
      redirect_to links_path
    else
      render :new
    end
  end
end