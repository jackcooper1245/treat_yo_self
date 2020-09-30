class TreatsController < ApplicationController
    def index
        @treats = Treat.all
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

    def random
        @treat = Treat.all.sample(1)
    end


    private

    def treat_params
        params.require(:treat).permit(:name, :cost, :user_id)
    end
    
end
