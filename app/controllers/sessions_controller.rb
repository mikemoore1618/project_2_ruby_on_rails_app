class SessionsController < ApplicationController
  def new
  end

  def create
    #look for a user with the provided email.
    @user = User.find_by_email(params[:email])
    #If there's a user with that email AND the password they provided is correct...
    if @user && @user.authenticate(params[:password])
      #add that user's ID to the session (the client will be given an updated cookie).
      session[:user_id] = @user.id

      ###########################################
      flash[:success] = "Welcome, #{@user.name}!"
      ###########################################
    
      #redirect to the user's profile (show) page.
      redirect_to user_path(@user)
    else
      ###########################################
      flash[:danger] = 'Incorrect email or password. Please try again.'
      ###########################################
    
      #otherwise, redirect back to the login form page to try again.
      redirect_to new_session_path
    end
  end

  def destroy
    #clear the user's ID out of the cookie
    session[:user_id] = nil
    #redirect to the home page 
    redirect_to root_path
  end
end
