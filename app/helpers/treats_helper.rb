module TreatsHelper
    def randomize_treat
        current_user.treats.sample
    end

    def add_treat_to_list
        @treat.lists << @list
    end

    def treats_for_calendar
        current_user.treats.each do |treat|
            if treat.start_time
            end
        end
    end
end
