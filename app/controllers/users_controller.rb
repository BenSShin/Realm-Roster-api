class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :create]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: current_user.id)
    render :show
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(
        username: params[:username],
        email: params[:email],
        profile_picture: params[:profile_picture],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        group_id: params[:group_id],
      )
      if @user.save
        render :show
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "Password and password_confirmation don't match" }
    end
  end

  def update
    if params[:id].to_i == current_user.id
      @user = User.find_by(id: params[:id])
      @user.update(
        username: params[:username] || @user.username,
        email: params[:email] || @user.email,
        profile_picture: params[:profile_picture] || @user.profile_picture,
        group_id: params[:group_id] || @user.group_id,
      )
      if @user.save
        render :show
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { error: "You can only edit your account." }
    end
  end

  def destroy
    if params[:id].to_i == current_user.id
      @user = User.find_by(id: params[:id])
      @user.destroy
      render json: { message: "User has been deleted" }
    else
      render json: { errors: "You can only delete your account" }
    end
  end
end
