class TreatsController < ApplicationController
    def index
        @treats = current_user.treats
    end

    def new    
        @treat = Treat.new(user_id: params[:user_id])
    end

    def create
        @treat = Treat.new(user_id: params[:user_id])
        @treat = Treat.create(treat_params)
        if @treat.valid?
            redirect_to treats_path
        else
            render :new
        end
    end

    def show
        @treat = Treat.find_by(id: params[:id])
    end


    def random
        @treat = Treat.all.sample(1)
    end

        
    def destroy 
        @treat = Treat.find_by(id: params[:id])
        @treat.delete
        redirect_to treats_path
    end 


    private

    def treat_params
        params.require(:treat).permit(:name, :cost, :user_id)
    end
    
end
