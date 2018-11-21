class PostsController < ApplicationController
  
  before_action :require_login
  
  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_id: [])
  end
end
