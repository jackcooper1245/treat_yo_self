class BudgetsController < ApplicationController
    before_action :verified_user

    def new
        @budget = Budget.new(user_id: params[:user_id])
      end

    def create
        @budget = Budget.create(budget_params)
        if @budget.save
            redirect_to '/profile'
        else
            render :new
        end
    end

private

    def budget_params
        params.require(:budget).permit(:name, :total, :currency, :user_id)
    end
    
end
