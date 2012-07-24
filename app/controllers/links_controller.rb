class LinksController < ApplicationController
  def index
    @links = Link.order(:url).page(params[:page])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if !@link.valid_edit?
      flash[:error] = "You can only edit a submission within 15 minutes of its submission."
      redirect_to root_path
    elsif @link.update_attributes(params[:link])
      redirect_to root_path
    else
      render :edit
    end
  end
end
