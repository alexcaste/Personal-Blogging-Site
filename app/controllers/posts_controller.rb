class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_params


  def new
    if current_user == nil
      flash[:alert] = "You must login to ask such posts"
      redirect_to :login
    end
  end

  def create
    current_user.posts.push(@post)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
end

  def edit
  end

  def index
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "you suck"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
  end

private

def post_params
  params.require(:post).permit(:title, :body)
end

end
