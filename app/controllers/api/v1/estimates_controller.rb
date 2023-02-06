class Api::V1::EstimatesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_job
  before_action :set_estimate, only: [:show, :update, :destroy]
  before_action :authorize_estimate, only: [:update, :destroy]

  def index
    @estimates = @job.estimates.includes(:estimate_details, :job, user: :role)
    render json: @estimates, each_serializer: EstimateSerializer
  end

  def show
    render json: @estimate, serializer: EstimateSerializer
  end

  def create
    @estimate = CreateEstimateInteractor.execute(@job, estimate_params, current_user)
    authorize @estimate
    if @estimate.save
      render json: @estimate, serializer: EstimateSerializer
    else
      render json: @estimate.errors, status: :unprocessable_entity
    end
  end

  def update
    if @estimate.update(estimate_params)
      render json: @estimate, serializer: EstimateSerializer
    else
      render json: @estimate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @estimate.destroy
      render json: @estimate, serializer: EstimateSerializer
    else
      render json: @estimate.errors, status: :unprocessable_entity
    end
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
