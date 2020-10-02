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

    def edit
        @list = List.find_by(id: params[:id])
    end

    def update
            @list = List.find_by(:id => params[:id])
            @list.update(list_params)
            if
            @list.valid?
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
