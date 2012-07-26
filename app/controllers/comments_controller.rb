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
      redirect_to link_path(find_link(@commentable))
    else
      render :new
    end
  end

  private
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def find_link(commentable)
    if commentable.commentable_type == "Link"
      commentable
    else
      find_link(commentable.commentable)
    end
  end
end
