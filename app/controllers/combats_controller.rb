class CombatsController < ApplicationController
  before_action :authenticate_user

  def index 
    @combats = Combat.where(user_id: current_user.id && tab_id: params[:tab_id])
    render :index
  end
  
  
  
  
end
