class PostsController < ApplicationController
  #verify who is logged in and only let person logged in edit or delte their own posts
  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    #search query
    if params[:q]
      #display search results, .where is looking for where it finds similarities "ILIKE" in "tag" to search query"?" "I" is "case Insensitive".
      @posts = Post.where("tag ILIKE ?", "%#{params[:q]}%")
    elsif params[:sort_by] == 'tag'
      #sort by Alphabetical 
      @posts = Post.order('tag')
      #display "Alphabetical" h1
      @header = "Alphabetical"
    elsif params[:sort_by] == 'created_at'
      #sort by Most Recent
      @posts = Post.order('created_at DESC')
      # display "Most Recent" h1
      @header = "Most Recent"
    elsif params[:sort_by] == 'random'
      #sort by Random
      @posts = Post.all.shuffle
      # display "Random" h1
      @header = "Random"
    else
      #default sort order
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
    #define input for post audio field
    @post.audio = params[:post][:audio]
    #define input for post tag field
    @post.tag = params[:post][:tag]
    # set user to who is currently logged in
    @post.user_id = current_user.id
    if @post.save
      #take you back to your own user page after creating post
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
    #define input for post tag field
    @post.audio = params[:post][:audio]
    #define input for post tag field
    @post.tag = params[:post][:tag]
    @post.save
    #take you back to your own user page after creating post
    redirect_to user_path(current_user.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    #clears cookies
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
