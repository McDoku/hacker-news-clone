class LinksController < ApplicationController
  before_filter :authorize, :only => [:new, :create, :edit, :update]

  def index
    @links = Link.scoped.page(params[:page])
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

  def edit
    @link = Link.find(params[:id])
    if !@link.valid_edit?
      flash['error'] = "You can only edit a submission within 15 minutes of its submission."
      redirect_to links_path
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "You risked it all and gained everything.  Congratulations.  You've just updated your submission."
      redirect_to links_path
    else
      render :edit
    end
  end
end
