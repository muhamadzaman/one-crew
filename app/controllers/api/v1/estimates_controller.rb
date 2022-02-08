class Api::V1::EstimatesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_job
  before_action :set_estimate, only: [:show, :update, :destroy]
  before_action :authorize_estimate, only: [:update, :destroy]

  def index
    @estimates = Estimate.includes(:estimate_details)
  end

  def show
  end

  def create
    @estimate = CreateEstimateInteractor.execute(@job, estimate_params, current_user)
    authorize @estimate
    @estimate.save!
  end

  def update
    @estimate.update!(estimate_params)
  end

  def destroy
    @estimate.destroy!
  end

  private

    def set_job
      @job = Job.find(params[:job_id])
    end

    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    def estimate_params
      params.require(:estimate).permit(:name, :description, estimate_details_attributes: [
        :id,
        :job,
        :units,
        :time,
        :rate,
        :cost,
        :margin_multiple,
        :estimate_category,
        :unit_of_measure
      ])
    end

    def authorize_estimate
      authorize @estimate
    end
end
