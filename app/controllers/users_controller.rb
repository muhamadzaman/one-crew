class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, except: [:index]
  before_action :authorize_user, only: [:update]

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user.update!(role: @role)
  end

  private

    def set_params
      @user = User.find(params[:id])
      @role = Role.find_by(name: user_params[:role])
    end

    def user_params
      params.require('user').permit(:role)
    end

    def authorize_user
      authorize @user
    end
end
