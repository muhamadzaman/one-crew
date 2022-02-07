class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, except: [:index, :create]

  def index
    @jobs = Job.all
  end

  def show
  end

  def create
    @job = Job.create!(job_params.merge(user: current_user))
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
end
