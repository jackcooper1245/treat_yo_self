class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new 
        @user = User.new
    end 
    
    def create 
        if auth
         @user = User.find_or_create_by(:email => auth["info"]["email"]) do |u|
            u.name = auth["info"]["name"]
            u.password = SecureRandom.hex(10)
         end
         session[:user_id] = @user.id
         redirect_to root_path 
        else 
            @user = User.find_by(:email => params[:user][:email])

            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to root_path 
            else 
             flash[:errors] = "Errors!"
                redirect_to '/login'
            end 
        end
    end 
    
    
    
    def destroy 
        session.delete :user_id
        redirect_to root_path
    end 

        def create_with_facebook
            
        end
       
        private
       
        def auth
          request.env['omniauth.auth']
        end
    
end
