class SpellsController < ApplicationController
  def index
    @spells = Spell.all
    render :index
  end

  def show
    @spell = Spell.find_by(id: params[:id])
    render :show
  end
end
