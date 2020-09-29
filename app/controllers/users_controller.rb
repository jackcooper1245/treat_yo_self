class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to root_path
            session[:user_id] = @user.id 
        else 
            render :new
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
    end

    def edit
    end

    def delete
    end


    private
    
    def user_params
        params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :age)
    end
end
