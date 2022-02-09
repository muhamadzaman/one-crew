require 'httparty'
require 'byebug'
class OneCrewTest
  include HTTParty
  base_uri ENV['API_URL'] || 'http://127.0.0.1:3003'

  def delete_estimate(job_id =  @job_id, estimate_id = @estimate_id)
    puts "Estimate for job id #{job_id}"
    response = self.class.delete("/api/v1/jobs/#{job_id}/estimates/#{estimate_id}", headers: headers)

    if response.success?
      puts 'Estimate deleted'
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def update_estimate(estimate_data = sample_estimate, job_id = @job_id, estimate_id = @estimate_id)
    puts "Estimate for job id #{job_id}"
    response = self.class.patch("/api/v1/jobs/#{job_id}/estimates/#{estimate_id}", headers: headers, body: estimate_data)

    if response.success?
      puts 'Estimate updated'
      @saved_estimate = response.parsed_response
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def create_estimate(estimate_data = sample_estimate, job_id = @job_id)
    puts "Estimate for job id #{job_id}"
    response = self.class.post("/api/v1/jobs/#{job_id}/estimates", headers: headers, body: estimate_data)

    if response.success?
      puts 'Estimate created'
      @estimate_id = response.parsed_response['id']
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def estimates(job_id = @job_id)
    puts "Estimates for job id #{job_id}"
    response = self.class.get("/api/v1/jobs/#{job_id}/estimates", headers: headers)

    if response.success?
      puts 'Estimate list'
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def create_job(name='test', address='Jack Horsey 123 Fake Street Sacramento, CA', description='test')
    puts "Creating job #{name}"
    response = self.class.post('/api/v1/jobs', headers: headers, body: { job: { name: name, address: address, description: description }})

    if response.success?
      puts 'job created'
      @job_id = response.parsed_response['id']
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def get_jobs
    puts "Creating job #{name}"
    response = self.class.get('/api/v1/jobs', headers: headers)

    if response.success?
      puts 'job created'
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def set_user_role(id=2, role='contractor')
    response = self.class.patch("/api/v1/users/#{id}", headers: headers, body: { user: { role: role } })
    if response.success?
      puts 'Role updated successfully'
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def login(email = 'contractor@example.com', password = '123456')
    puts "login as #{email}"
    response = self.class.post('/auth/sign_in', body: { email: email, password: password })

    if response.success?
      @uid = response.headers['uid']
      @client = response.headers['client']
      @token = response.headers['access-token']
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response
  end

  def sign_up(email, name, password, password_confirmation)
    p "sign up as #{email}"
    response = self.class.post('/auth', body: {
      email: email, name: name, password: password, password_confirmation: password_confirmation
    })

    if response.success?
      @uid = response.headers['uid']
      @client = response.headers['client']
      @token = response.headers['access-token']
      @user_id = response.parsed_response['id']
      p response.parsed_response
    else
      puts 'Request Faild'
      p response.parsed_response['errors']
    end
    response.parsed_response
  end

  private
    def headers(options = {})
      {
        uid: @uid,
        client: @client,
        'access-token': @token
      }.merge(options)
    end

    def sample_estimate
      {
        estimate: {
          name: 'first job 11',
          description: 'test',
          estimate_details_attributes: [
            {
              job: 'crew',
              units: 3,
              time: 3,
              rate: 40,
              cost: 20,
              margin_multiple: 1.2,
              estimate_category: 'Labor',
              unit_of_measure: 'hrs'
            },
            {
              job: 'Asphalt',
              units: 3,
              time: 3,
              rate: 40,
              cost: 20,
              margin_multiple: 1.2,
              estimate_category: 'Materials',
              unit_of_measure: 'hrs'
            }
          ]
        }
      }
    end
end
