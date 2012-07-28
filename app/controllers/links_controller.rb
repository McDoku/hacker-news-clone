class LinksController < ApplicationController
  before_filter :authorize, :only => [:new, :create, :edit, :update]

  def show
    @link = Link.find(params[:id])
    @vote = Vote.new
    if signed_in?
      @comment = Comment.new
    else
      flash.now[:notice] = "Sign in or create an account to leave comments."
    end
  end

  def index
    @links = Kaminari.paginate_array(Link.all.sort_by(&:score).reverse).page(params[:page])
    @vote = Vote.new
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
    unless @link.valid_edit?
      flash[:error] = "Sorry, you can only edit a link within 15 minutes of its submission."
      redirect_to links_path
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:success] = "You risked it all and gained everything. Congratulations. You've just updated your submission."
      redirect_to links_path
    else
      render :edit
    end
  end
end
