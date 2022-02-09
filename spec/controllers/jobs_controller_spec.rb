require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do
  let(:default_headers) do
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  end

  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token.merge(default_headers) }
  let!(:job) { create(:job) }

  context '#index' do
    it 'should return success' do
      request.headers.merge!(headers)

      get :index
      expect(response).to be_successful
    end
  end

  context '#show' do
    it 'should return success' do
      request.headers.merge!(headers)

      get :show, params: { id: job.id }
      expect(response).to be_successful
    end
  end

  context '#create' do
    let(:params) {
      {
        job: {
          name: 'test',
          address: 'santa clara',
          description: 'test'
        }
    }}

    it 'should return success' do
      request.headers.merge!(headers)

      expect { post :create, params: params }
        .to change { Job.count }.by (1)
      expect(response).to be_successful
    end
  end
end
