class BudgetController < ApplicationController
    before_action :verified_user

    def new
        @budget = Budget.new(user_id: params[:user_id])
      end

    def create
        @budget = Budget.create(budget_params)
        if @budget.save
            redirect_to profile_path
        else
            render new_budget_path
        end
    end

    def edit
        @budget = Budget.find_by(:id => current_user.budget.id)

    end

    def update
        @budget = Budget.find_by(:id => current_user.budget.id)
        @budget.update(budget_params)
        if
        @budget.valid?
        redirect_to profile_path
    else
        render :edit
    end
    

    end

private

    def budget_params
        params.require(:budget).permit(:name, :total, :currency, :user_id)
    end
    
end
