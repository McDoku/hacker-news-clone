class LinksController < ApplicationController
  before_filter :authorize, :only => [:new, :create, :edit, :update]
  before_filter :find_link, :only => [:show, :edit, :update]

  def show
    @comment = Comment.new
    @commentable = @link
  end

  def index
    sorted_links = Link.all.sort_by(&:score).reverse
    @links = Kaminari.paginate_array(sorted_links).page(params[:page])
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
    if !@link.valid_edit?
      flash[:error] = "You can only edit a submission within 15 minutes of its submission."
      redirect_to links_path
    end
  end

  def update
    if @link.update_attributes(params[:link])
      flash[:success] = "You risked it all and gained everything.  Congratulations.  You've just updated your submission."
      redirect_to links_path
    else
      render :edit
    end
  end

  private
  def find_link
    @link = Link.find(params[:id])
  end
end
