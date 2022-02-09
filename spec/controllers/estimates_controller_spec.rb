require 'rails_helper'

RSpec.describe Api::V1::EstimatesController, type: :controller do
  let(:default_headers) do
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  end

  let(:user) { create(:user, :contractor) }
  let(:headers) { user.create_new_auth_token.merge(default_headers) }
  let!(:job) { create(:job) }
  let!(:estimate) { create(:estimate, job: job, user: user) }

  context '#index' do
    it 'should return success' do
      request.headers.merge!(headers)

      get :index, params: { job_id: job.id }
      expect(response).to be_successful
    end
  end

  context '#show' do
    it 'should return success' do
      request.headers.merge!(headers)

      get :show, params: { job_id: job.id, id: estimate.id }
      expect(response).to be_successful
    end
  end

  context '#create' do
    let(:params) {
      {
        estimate: {
            name: 'test estimate',
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
                }
            ]
        }
    }}

    it 'should return success' do
      request.headers.merge!(headers)

      expect { post :create, params: params.merge(job_id: job.id) }
        .to change { Estimate.count }.by(1)
        .and change{ EstimateDetail.count }.by (1)
      expect(response).to be_successful
    end
  end

  context '#update' do
    let(:params) {
      {
        estimate: {
            name: 'test estimate',
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
                }
            ]
        }
    }}

    it 'should return success' do
      request.headers.merge!(headers)

      expect { patch :update, params: params.merge(job_id: job.id, id: estimate.id) }
        .to change { estimate.estimate_details.count }.by (1)
      expect(response).to be_successful
    end
  end

  context '#destroy' do
    it 'should return success' do
      request.headers.merge!(headers)

      expect {delete :destroy, params: { id: estimate.id, job_id: job.id }}
        .to change{Estimate.count}.by(-1)
      expect(response).to be_successful
    end
  end
end
