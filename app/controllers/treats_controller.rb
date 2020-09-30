class TreatsController < ApplicationController
    def index
        @treats = Treat.all
    end

    def new
        @treat = Treat.new(user_id: params[:user_id])
    end
end
