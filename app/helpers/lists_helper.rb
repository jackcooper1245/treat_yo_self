module ListsHelper

    def current_list
        @list = List.find_by(id: params[:id])
    end

    def current_treats
       @list.treats
    end

    def assign_list_to_treat
        @list.treats << @treat
    end

    def available_treats
        current_user.treats.where(list_id: nil)   
    end

    def assigned_list
        current_user.lists.find_by(id: treat.list_id).name
    end

end
