module BudgetsHelper
        def budget_with_currency
            "#{current_user.budget.currency}" + "#{current_user.budget.total}"
        end

        def adjust_budget(treat)
            (current_user.budget.total - treat.cost)
        end
end
