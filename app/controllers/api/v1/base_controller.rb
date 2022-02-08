class Api::V1::BaseController < ApplicationController
  include Rescueable

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  respond_to :json

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
