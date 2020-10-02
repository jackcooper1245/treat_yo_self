module ListsHelper
    def current_cycle
        current_user.lists.first
    end
end
