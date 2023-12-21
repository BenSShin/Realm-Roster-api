class GroupsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @groups = Group.includes(:users, :messages).all
    render :index
  end

  def show
    @group = Group.includes(:users, :messages).find_by(id: params[:id])
    render :show
  end

  def create
    @group = Group.new(
      name: params[:name],
      meetup: params[:meetup],
      location: params[:location],
    )
    if @group.save
      render :show
    else
      render json: { errors: @group.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.update(
      name: params[:name] || @group.name,
      meetup: params[:meetup] || @group.meetup,
      location: params[:location] || @group.location,
    )
    render :show
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.destroy
    render json: { message: "Group has been destroyed." }
  end
end
