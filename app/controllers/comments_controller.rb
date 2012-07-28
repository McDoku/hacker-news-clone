class CommentsController < ApplicationController
  before_filter :authorize, :only => [:new, :create]
  before_filter :load_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Thank you for your comment."
      if @commentable.is_a? Link
        redirect_to link_path(@commentable)
      else
        redirect_to link_path(find_link(@commentable))
      end
    else
      render :new
    end
  end

  private
  def load_commentable
    if params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    else
      @commentable = Link.find(params[:link_id])
    end
  end

  def find_link(commentable)
    if commentable.commentable_type == "Link"
      commentable.commentable
    else
      find_link(commentable.commentable)
    end
  end
end
