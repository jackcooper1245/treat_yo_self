class LtsController < ApplicationController

    def create
       
        @lt = Lt.create(lt_params)
        if @lt.save
            redirect_to list_path(@lt.list)
        else 
            render list_path(@list)
        end
    end

    def destroy 
        @list = List.find_by(id: params[:list_id])
        @lt = Lt.find_by(id: params[:id])
        @lt.delete
        redirect_to list_path(@list)
    end 

private

    def lt_params
        params.require(:lt).permit(:start_time, :list_id, :treat_id)
    end
end
