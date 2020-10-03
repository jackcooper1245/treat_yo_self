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

    def update
        @treat = Treat.find_by(id: params[:id])
        @treat.update(treat_params)
        if @treat.valid?
            redirect_to root_path
        else
            render treat_path(@treat)
        end
    end

    def show
        @list = List.find_by(id: params[:id])
        @treat = Treat.find_by(id: params[:id])
        @budget = Budget.find_by(id: current_user.id)
    end



    def random
        @treat = Treat.all.sample(1)
        redirect_to treat_path(@treat)
    end

    def destroy 
        @treat = Treat.find_by(id: params[:id])
        @treat.delete
        redirect_to treats_path
    end 


    private

    def treat_params
        params.require(:treat).permit(:name, :cost, :user_id, :start_time)
    end
    
end
