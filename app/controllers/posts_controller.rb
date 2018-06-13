class PostsController < ApplicationController

  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    id = params[:id]
    @post =  Post.find(id)
    # @post.user_id = current_user.id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.audio = params[:post][:audio]
    @post.caption = params[:post][:caption]
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user.id)
    else
      render "new" #same as redirect_to new_product_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.audio = params[:post][:audio]
    @post.caption = params[:post][:caption]
    @post.save
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    session[:post_id] = nil
    redirect_to '/'
  end

  def verify_user
    #checks that the current logged in user is the same user who created the post
     @post = Post.find(params[:id])
     unless @post.user_id == current_user
     end
    end

end
