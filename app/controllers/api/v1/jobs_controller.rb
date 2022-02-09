class Api::V1::JobsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_job, except: [:index, :create]
  before_action :authorize_job, only: [:update, :destroy]

  def index
    @jobs = Job.includes(user: :role)
    render json: @jobs, each_serializer: JobSerializer
  end

  def show
    render json: @job, serializer: JobSerializer
  end

  def create
    @job = Job.new(job_params.merge(user: current_user))
    authorize @job
    if @job.save
      render json: @job, serializer: JobSerializer
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job, serializer: JobSerializer
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.destroy
      render json: @job, serializer: JobSerializer
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require('job').permit(:name, :address, :description)
    end

    def authorize_job
      authorize @job
    end
end
