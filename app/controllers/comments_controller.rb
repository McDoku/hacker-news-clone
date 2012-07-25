class CommentsController < ApplicationController
  before_filter :authorize, :only => [:new, :create]
  before_filter :link

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.link = @link

    if @comment.save
      flash[:success] = "Thank you for your comment."
      redirect_to link_comments_path
    else
      render :new
    end
  end

  def index
    @comments = Comment.find_all_by_link_id(params[:link_id])
  end

  private

  def link
    @link = Link.find(params[:link_id])
  end
end