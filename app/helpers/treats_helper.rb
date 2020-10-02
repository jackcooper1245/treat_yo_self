module TreatsHelper
    def randomize_treat
        current_user.treats.sample
    end

    def add_treat_to_list
        @treat.lists << @list
    end
end
