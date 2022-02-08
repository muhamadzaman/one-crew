class CreateEstimateInteractor < Base
  attr_reader :job, :params, :current_user

  def initialize(job, params, current_user)
    @job = job
    @params = params
    @current_user = current_user
  end

  def execute
    job.estimates.build(params.merge(user_id: current_user.id))
  end
end