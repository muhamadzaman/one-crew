class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  before_action :set_role, only: [:update]
  before_action :authorize_user

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user.update!(role: @role)
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
