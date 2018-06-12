class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    id = params[:id]
    @post =  Post.find(id)
  end

  def new
  end

  def create
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.audio = params[:post][:audio]
    @post.caption = params[:post][:caption]
    @post.save
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    session[:post_id] = nil
    redirect_to '/'
  end
end
