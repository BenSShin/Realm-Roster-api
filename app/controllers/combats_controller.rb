class CombatsController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:tab_id]
      @combats = Combat.order(initiative_roll: :desc).where(user_id: current_user.id, tab_id: params[:tab_id])
    else
      @combats = Combat.order(initiative_roll: :desc).where(user_id: current_user.id)
    end
    render :index
  end

  def show
    @combat = Combat.find_by(user_id: current_user.id, id: params[:id])
    render :show
  end

  def create
    @combat = Combat.new(
      user_id: current_user.id,
      tab_id: params[:tab_id],
      creature_name: params[:creature_name],
      initiative_roll: params[:initiative_roll],
      health: params[:health],
      status: params[:status],
    )
    if @combat.save
      render :show
    else
      render json: { errors: @combat.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @combat = Combat.find_by(user_id: current_user.id, id: params[:id])
    @combat.update(
      user_id: current_user.id,
      tab_id: @combat.tab_id,
      creature_name: params[:creature_name] || @combat.creature_name,
      initiative_roll: params[:initiative_roll] || @combat.initiative_roll,
      health: params[:health] || @combat.health,
      status: params[:status] || @combat.status,
    )
    if @combat.save
      render :show
    else
      render json: { errors: @combat.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @combat = Combat.find_by(user_id: current_user.id, id: params[:id])
    @combat.destroy
    render json: { message: "card was deleted" }
  end
end
