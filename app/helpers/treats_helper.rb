module TreatsHelper
    def randomize_treat
        current_user.treats.sample
    end
end
