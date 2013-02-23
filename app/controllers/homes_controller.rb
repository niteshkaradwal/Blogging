class HomesController < ApplicationController
  
  def index
    @current_user_followed = current_user.followed
  end

end
