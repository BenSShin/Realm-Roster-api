class MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:group_id]
      @messages = Message.where(group_id: (params[:group_id]))
    else
      @messages = Message.where(user_id: current_user.id)
    end
    @messages = @messages.order("created_at DESC")
    render :index
  end

  def show
    @message = Message.find_by(id: params[:id])
    render :show
  end

  def create
    @message = Message.create(
      user_id: current_user.id,
      group_id: current_user.group_id,
      content: params[:content],
    )
    render :show
  end

  def update
    @message = Message.find_by(id: params[:id])
    @message.update(
      user_id: current_user.id,
      group_id: current_user.group_id,
      content: params[:content] || @message.content,
    )
    render :show
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.delete
    render json: { message: "Message deleted." }
  end
end
