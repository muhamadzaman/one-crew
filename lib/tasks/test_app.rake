require_relative '../one_crew_test'

namespace :one_crew do
  desc 'This is rake task to some sample operations '
  task api_test: :environment do
    one_crew = OneCrewTest.new()
    puts 'Login as client'
    one_crew.login('client@example.com', '123456')
    puts '=' * 150

    puts 'Creating job'
    one_crew.create_job
    puts '=' * 150

    puts 'Login as contractor'
    one_crew.login('contractor@example.com', '123456')
    puts '=' * 150

    puts 'Creating Estimate'
    one_crew.create_estimate
    puts '=' * 150

    puts 'Get/read Estimates'
    one_crew.estimates
    puts '=' * 150

    puts 'Update estimate'
    estimate = { "estimate": {
      "estimate_details_attributes": [{
        "job"=>"Jackhammer",
        "units"=>"3.0",
        "rate"=>"40.0",
        "cost"=>"20.0",
        "bid"=>"180.0",
        "margin_multiple"=>"1.2",
        "estimate_category"=>"Materials",
        "unit_of_measure"=>"hrs"
      }]}}
    one_crew.update_estimate(estimate)
    puts '=' * 150

    puts 'Delete Estimate'
    one_crew.delete_estimate
  end
end
