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
        current_user.treats.where.not(list_id: current_list.id)
    end
            
    def list_name(treat)
        @list = List.find_by(id: treat.list_id)
        @list.name
    end


end
