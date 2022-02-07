class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_failed
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::ParameterMissing, with: :render_bad_request
  rescue_from Pundit::NotAuthorizedError, with: :render_not_authrized_request

  protect_from_forgery with: :null_session
  respond_to :json

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def render_validation_failed(exception)
      render 'shared/validation_failed', locals: { exception: exception }, status: :bad_request
    end

    def render_not_found(message = nil)
      render 'shared/not_found', locals: { message: message }, status: :not_found
    end

    def render_bad_request(message = nil)
      render 'shared/bad_request', locals: { message: message }, status: :bad_request
    end

    def render_not_authrized_request(message = nil)
      render 'shared/not_authrized_request', locals: { message: message }, status: :bad_request
    end
end
