class ListsController < ApplicationController
before_action :verified_user
    def index
        @lists = current_user.lists
    end

    def new
        @list = List.new(user_id: params[:user_id])
    end

    def create
        @list = List.new(user_id: params[:user_id])
        @list = List.create(list_params)
        if @list.valid?
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @list = List.find_by(id: params[:id])
    end


    def add_treat
        @list = List.find_by(id: params[:list_id])
        @treat = Treat.find_by(id: params[:treat_id])
        @list.treats << @treat
        @treat.lists << @list
        
        redirect_to list_path(@list)
    end

    def remove_treat
    
        @list = List.find_by(id: params[:list_id])
        @treat = Treat.find_by(id: params[:treat_id])

        @list.treats.select do |treat| 
           @list.treats.delete(treat) if treat.name == @treat.name
        end
        redirect_to list_path(@list)
    end

    def select_treat
        @treat = Treat.find_by(id: params[:treat_id])
        @list = List.find_by(id: params[:list_id])
        @list.budget.total = (@list.budget.total - @treat.cost)
        redirect_to list_path(@list)
    end


    def edit
        @list = List.find_by(id: params[:id])
    end

    def update
            @list = List.find_by(:id => params[:id])
            @list.update(list_params)
            if
            @list.valid?
            raise params.inspect
            redirect_to root_path
        else
            render :edit
        end
    end

    private

    def list_params
        params.require(:list).permit(:name, :start_time, :end_time, :number_of_treats, :user_id, :budget)
    end
end
