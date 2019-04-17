class ApplicationController < ActionController::Base
    # make the below methods available in our view templates:  
    helper_method :current_user, :logged_in?

    #return the current user (the user that's making a request at any given moment).
    def current_user
        @current_user || = User.find(session[:user_id]) if session[:user_id]
    end

    #return a simple boolean (are they logged in? true or false).
    def logged_in?
        !!current_user
    end
    
    #redirect the client to a different page if they try to access specific routes without being logged in.
    def authorize
        redirect_to new_session_path unless logged_in?
    end
end
