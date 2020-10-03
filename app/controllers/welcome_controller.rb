class WelcomeController < ApplicationController
  before_action :verified_user
  
  def index
    @treats = current_user.treats.where.not(start_time: nil)
  end

end
