class PostsController < ApplicationController

  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    if params[:q]
      @posts = Post.where("tag ILIKE ?", "%#{params[:q]}%")
    elsif params[:sort_by] == 'tag'
      @posts = Post.order('tag')
      @header = "Alphabetical"
    elsif params[:sort_by] == 'created_at'
      @posts = Post.order('created_at DESC')
      @header = "Most Recent"
    elsif params[:sort_by] == 'random'
      @posts = Post.all.shuffle
      @header = "Random"
    else
      @posts = Post.all.reverse
    end
  end

  def show
    id = params[:id]
    @post =  Post.find(id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.audio = params[:post][:audio]
    @post.tag = params[:post][:tag]
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
    @post.tag = params[:post][:tag]
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
