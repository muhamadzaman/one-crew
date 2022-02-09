require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:default_headers) do
    {
      'Content-Type' => 'application/json',
      'Accept'       => 'application/json'
    }
  end

  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token.merge(default_headers) }

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

      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  context '#update' do
    let!(:role) { create(:role, name: 'client') }
    let!(:user_1) { create(:user, :contractor) }

    let(:params) {{
      user: {
        role: 'client'
      }
    }}

    it 'should return success' do
      request.headers.merge!(headers)

      expect { patch :update, params: params.merge(id: user_1.id) }
        .to change { user_1.reload.role.name }.from('contractor')
        .to('client')
      expect(response).to be_successful
    end
  end
end
