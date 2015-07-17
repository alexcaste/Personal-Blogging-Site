class CommentsController < ApplicationController
    load_and_authorize_resource param_method: :comment_params
    load_and_authorize_resource :post
  def new
  end

  def index
  end

  def create
    if @comment.save
      @post.comments.push(@comment)
      current_user.comments.push(@comment)
      respond_to do |format|
        flash[:notice] = "Your comment has been submitted!"
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = "Please try again.  There was a problem with your comment."
        format.html { redirect_to post_path(@post) }
        format.js
      end
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been updated!"
      redirect_to post_path(@comment.post)
    else
      flash[:alert] = "you suck"
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post)
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
