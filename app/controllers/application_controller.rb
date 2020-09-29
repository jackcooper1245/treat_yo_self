class ApplicationController < ActionController::Base
    before_action :verified_user
    helper_method :current_user
  
    private
  
    def verified_user 
      redirect_to '/login' unless logged_in 
    end 
  
    def logged_in
      !!current_user 
    end 
  
    def current_user
      User.find_by_id(session[:user_id])
    end
end
