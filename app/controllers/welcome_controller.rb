class WelcomeController < ApplicationController
  before_action :verified_user
  
  def index
    @lts = current_user.lts.all
  end
  
end
