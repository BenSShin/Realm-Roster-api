class MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:group_id]
      @messages = Message.where(group_id: (params[:group_id]))
    else
      @messages = Message.where(user_id: current_user.id)
    end
    @messages = @messages
    render :index
  end

  def show
    @message = Message.find_by(id: params[:id])
    render :show
  end

  def create
    @message = Message.create(
      user_id: current_user.id,
      group_id: params[:group_id],
      content: params[:content],
    )
    render :show
  end

  def update
    @message = Message.find_by(id: params[:id], user_id: current_user.id)
    @message.update(
      user_id: current_user.id,
      group_id: params[:group_id],
      content: params[:content] || @message.content,
    )
    if @message.save
      render :show
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @message = Message.find_by(id: params[:id], user_id: current_user.id)
    @message.delete
    render json: { message: "Message deleted." }
  end
end
