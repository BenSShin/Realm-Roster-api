class CharactersController < ApplicationController
  before_action :authenticate_user

  def index
    @characters = Character.where(user_id: current_user.id)
    render :index
  end

  def show
    @character = Character.find_by(id: params[:id], user_id: current_user.id)
  end
end
