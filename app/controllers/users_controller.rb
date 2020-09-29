class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to root_path
        else 
            render :new
        end
    end

    def show
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
