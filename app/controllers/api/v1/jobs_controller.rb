class Api::V1::JobsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_job, except: [:index, :create]
  before_action :authorize_job, only: [:update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def create
    @job = Job.new(job_params.merge(user: current_user))
    authorize @job
    @job.save!
  end

  def update
    @job.update!(job_params)
  end

  def destroy
    @job.destroy!
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
