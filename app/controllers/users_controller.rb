class UsersController < ApplicationController
    
    skip_before_action :verified_user, only: [:new, :create]
    def new
        @user ||= User.new
        @budget = Budget.new
        @user.budget = @budget
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to root_path
            session[:user_id] = @user.id 
        else 
             render '/users/new'
        end
    end

    def show
        @user = User.find_by(:id => current_user[:id])
    end

    def edit
        @user = User.find_by(:id => params[:id])
    end

    def update
        @user = User.find_by(:id => params[:id])
        if @user && @user.authenticate(params[:user][:password])
            @user.update(user_params)
            redirect_to profile_path
        else
            render :edit
         end
    end

    def delete
    end


    private
    
    def user_params
        params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :age, {budget_attributes: [:total, :currency]})
    end
end
