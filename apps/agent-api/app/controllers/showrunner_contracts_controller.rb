class ShowrunnerContractsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_showrunner_contract, only: [ :show, :update, :destroy ]

  def index
    user = User.find(params[:user_id])
    render json: user.showrunner_contracts
  end


  # Afficher un contrat
  def show
  end

  # Créer un contrat de showrunner pour un utilisateur
  def create
    @user = User.find(params[:user_id])
    @showrunner_contract = @user.showrunner_contracts.new(showrunner_contract_params)
    @showrunner_contract.assetable = @user
  
    if @showrunner_contract.save
      render json: @showrunner_contract, status: :created
    else
      render json: { errors: @showrunner_contract.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Mettre à jour un contrat
  def update
    if @showrunner_contract.update(showrunner_contract_params)
      render json: @showrunner_contract
    else
      render json: @showrunner_contract.errors, status: :unprocessable_entity
    end
  end

  # Supprimer un contrat
  def destroy
    @showrunner_contract.destroy
  end

  private

  def set_showrunner_contract
    @showrunner_contract = ShowrunnerContract.find(params[:id])
  end

  def showrunner_contract_params
    params.require(:showrunner_contract).permit(:name, :price, :rarity, :purchase_price, :rarity_id, :assetable_type, :assetable_id, :user_id)
  end
end
