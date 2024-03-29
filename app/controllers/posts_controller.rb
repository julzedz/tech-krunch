class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_post_path(@post.user, @post)
    else
      flash.now[:error] = 'Something went wrong'
      render :new, status: 422
    end
  end
end
