require 'rails_helper'

RSpec.describe 'Sessions endpoint', type: :request do
  describe 'POST /sessions' do
    let(:params) { { username: username } }
    let!(:user) {
      User.create!(name: 'Test User', username: 'test@example.com')
    }

    before do
      User.create!(name: 'Test User', username: 'test@example.com')
      post '/sessions', params: params.to_json,
                        headers: { 'Content-Type' => 'application/json' }
    end

    context 'when username does not match' do
      let(:username) { 'foo@example.com' }

      specify do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when no username specified' do
      let(:params) { {} }

      specify do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['error']).to eq "'username' is required"
      end
    end

    context 'when username matches' do
      let(:username) { 'test@example.com' }

      specify do
        expect(response).to have_http_status(:success)
        expect(session[:current_user_id]).to eq(user.id)
      end
    end
  end
end
