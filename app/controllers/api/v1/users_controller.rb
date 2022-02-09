class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :set_role, only: [:update]
  before_action :authorize_user, only: [:update]

  def index
    @users = User.includes(:role)
    render json: @users, each_serializer: UserSerializer
  end

  def show
    render json: @user, serializer: UserSerializer
  end

  def update
    if @user.update(role: @role)
      render json: @user, each_serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_role
      @role = Role.find_by(name: user_params[:role]) if user_params[:role]
    end

    def user_params
      params.require('user').permit(:role)
    end

    def authorize_user
      authorize @user
    end
end
