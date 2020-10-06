module UsersHelper
    def current_user
        User.find_by_id(session[:user_id])
    end

def current_budget
    if current_user.budget
        link_to "Update budget", edit_budget_path(current_user)
    else
    link_to "Set budget", new_user_budget_path(current_user)
    end
end
end
