class Api::V1::BaseController < ApplicationController
  include Rescueable

  respond_to :json
end
