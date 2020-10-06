class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new 
        @user = User.new
    end 
    
    def create 
        @user = User.find_by(:user_name => params[:user][:user_name])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path 
        else 
         flash[:errors] = "Errors!"
            redirect_to '/login'
        end 
    end 
    
    
    
    def destroy 
        session.delete :user_id
        redirect_to root_path
    end 

end
