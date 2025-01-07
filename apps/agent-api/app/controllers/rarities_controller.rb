class RaritiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_rarity, only: [ :show, :update, :destroy ]
  def index
    render json: Rarity.all
  end

  def show
    render json: Rarity.find(params[:id])
  end

  def create
    @rarity = Rarity.new(rarity_params)
    if @rarity.save
      render json: @rarity, status: :created
    else
      render json: @rarity.errors, status: :unprocessable_entity
    end
  end

  def update
    @rarity = Rarity.find(params[:id])
    @rarity.update(rarity_params)
    render json: @rarity
  end

  def destroy
    @rarity = Rarity.find(params[:id])
    @rarity.destroy
    head :no_content
  end

  private

  def set_rarity
    @rarity = Rarity.find(params[:id])
  end

  def rarity_params
    params.require(:rarity).permit(:name)
  end
end
