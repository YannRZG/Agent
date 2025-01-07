class UsersController < ApplicationController
  include Authentication
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :require_authentication, only: [:create]
  before_action :set_user, only: [ :update, :destroy]

  def index
    render json: User.all
  end

  def show
    render json: {
      user: @user,
      badges: @user.badges,
      showrunner_contracts: @user.showrunner_contracts
    }
  end

  def create
    Rails.logger.debug "Received parameters: #{params.inspect}"
    
    user = User.new(user_params)
    
    if user.save
      render json: { message: "User created successfully", user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render_errors(@user, :unprocessable_entity)
    end
  end

  def destroy
    if @user.destroy
      head :no_content
    else
      render_errors(@user, :unprocessable_entity)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email_address, :password, :openloot_id)
  end

  def render_errors(resource, status)
    render json: { errors: resource.errors.full_messages }, status: status
  end
end
