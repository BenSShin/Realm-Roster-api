class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
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
    @user = User.find_by(id: params[:id])
    @user.update(
      username: params[:username] || @user.username,
      email: params[:email] || @user.email,
      profile_picture: params[:profile_picture] || @user.profile_picture,
      group_id: params[:group_id] || @user.group_id,
    )
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User has been deleted" }
  end
end
