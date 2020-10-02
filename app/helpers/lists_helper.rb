module ListsHelper

    def current_cycle
        current_user.lists.first
    end


    def available_treats
        current_user.treats.where(list_id: nil)
    end


end
