class BadgesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_badge, only: [ :show, :update, :destroy ]

  def index
    user = User.find(params[:user_id])  # Récupérer l'utilisateur par ID
    render json: user.badges  # Retourner les badges de l'utilisateur
  end

  # Afficher un badge
  def show
  end

  # Créer un badge pour un utilisateur
  def create
    @user = User.find(params[:user_id])  # Récupérer l'utilisateur par ID
    @badge = @user.badges.new(badge_params)
    @badge.assetable = @user
    if @badge.save
      render json: @badge, status: :created
    else
      render json: { errors: @badge.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Mettre à jour un badge
  def update
    if @badge.update(badge_params)
      render json: @badge
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # Supprimer un badge
  def destroy
    Rails.logger.info "Destroy called with params: #{params.inspect}"
    @badge.destroy
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :rarity_id, :purchase_price, :efficiency, :assetable_type, :assetable_id, :user_id)
  end
end
