class PostsController < ApplicationController

  def index
    @posts = Post.all
    @page = @posts.page(params[:page]).per(10) #ページネーション
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body)
  end
end
