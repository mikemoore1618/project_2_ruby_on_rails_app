class UsersController < ApplicationController

  #restrict access
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user =  User.find(id)
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        redirect_to new_session_path
      else
        redirect_to new_user_path
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.save
    redirect_to '/'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end

   
