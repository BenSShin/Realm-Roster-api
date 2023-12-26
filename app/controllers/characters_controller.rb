class CharactersController < ApplicationController
  before_action :authenticate_user

  def index
    @characters = Character.where(user_id: current_user.id)
    render :index
  end

  def show
    @character = Character.find_by(id: params[:id], user_id: current_user.id)
    render :show
  end

  def create
    @character = Character.create(
      user_id: current_user.id,
      group_id: params[:group_id],
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description],
      race: params[:race],
      level: params[:level],
      class: params[:class],
    )
    render :show
  end

  def update
    @character = Character.find_by(id: params[:id], user_id: current_user.id)
    @character.update(
      user_id: current_user.id,
      group_id: params[:group_id] || @character.group_id,
      name: params[:name] || @character.name,
      image_url: params[:image_url] || @character.image_url,
      description: params[:description] || @character.description,
      race: params[:race] || @character.race,
      level: params[:level] || @character.level,
      class: params[:class] || @character.class,
    )
    render :show
  end

  def destroy
    @character = Character.find_by(id: params[:id], user_id: current_user.id)
    @character.destroy
    render json: { message: "Character has been deleted." }
  end
end
