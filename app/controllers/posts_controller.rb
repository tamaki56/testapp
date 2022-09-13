class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @post = @posts.page(params[:page]).per(10) #ページネーション
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
    @post.update(post_params)
    redirect_to posts_path
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
