class EventsController < ApplicationController
  before_action :authenticate_user

  def index
    @events = Event.where(group_id: params[:group_id])
    render :index
  end

  def show
    @event = Event.find_by(id: params[:id])
    render :show
  end

  def create
    @event = Event.new(
      group_id: params[:group_id],
      date: params[:date],
      time: params[:time],
      location: params[:location],
    )
    if @event.save
      render :show
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(
      group_id: @event.group_id,
      date: params[:date] || @event.date,
      time: params[:time] || @event.time,
      location: params[:location] || @event.location,
    )
    if @event.save
      render :show
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.delete
    render json: { message: "Event has been deleted." }
  end
end
